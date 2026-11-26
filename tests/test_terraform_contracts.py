import json
import unittest
from pathlib import Path

import hcl2


ROOT = Path(__file__).resolve().parents[1]
WRAPPERS = (
    "lambda_function_event_rule",
    "lambda_function_sns",
    "lambda_function_sqs",
)


def load_hcl(path):
    with path.open() as source:
        return hcl2.load(source)


def block_names(blocks):
    return {next(iter(block)) for block in blocks}


def lambda_module_inputs(module_name):
    blocks = load_hcl(ROOT / "modules/aws" / module_name / "main.tf")["module"]
    block = next(block["lambda_function"] for block in blocks if "lambda_function" in block)
    return {key: value for key, value in block.items() if key not in {"source", "__is_block__"}}


def resource_block(module_name, resource_type, resource_name):
    resources = load_hcl(ROOT / "modules/aws" / module_name / "main.tf")["resource"]
    return next(
        body[resource_type][resource_name]
        for body in resources
        if resource_type in body and resource_name in body[resource_type]
    )


class TerraformContractTests(unittest.TestCase):
    def test_lambda_wrappers_forward_shared_inputs(self):
        base_variables = block_names(
            load_hcl(ROOT / "modules/aws/lambda_function/variables.tf")["variable"]
        )
        allowlist_path = ROOT / "tests/wrapper_contract_allowlist.json"
        with allowlist_path.open() as source:
            allowlist = json.load(source)

        self.assertTrue(set(allowlist) <= set(WRAPPERS))

        for wrapper in WRAPPERS:
            with self.subTest(wrapper=wrapper):
                wrapper_variables = block_names(
                    load_hcl(ROOT / "modules/aws" / wrapper / "variables.tf")["variable"]
                )
                inputs = lambda_module_inputs(wrapper)
                self.assertEqual(
                    base_variables,
                    wrapper_variables & base_variables,
                    f"{wrapper} must declare every shared lambda_function input",
                )
                self.assertTrue(
                    base_variables <= inputs.keys(),
                    f"{wrapper} does not pass through: {sorted(base_variables - inputs.keys())}",
                )

                exceptions = allowlist.get(wrapper, {})
                self.assertTrue(set(exceptions) <= base_variables)
                for name in base_variables:
                    if name in exceptions:
                        self.assertTrue(exceptions[name].strip())
                    else:
                        self.assertEqual(f"${{var.{name}}}", inputs[name], f"{wrapper}.{name}")

    def test_event_rule_permission_is_scoped_to_its_rule(self):
        permission = resource_block(
            "lambda_function_event_rule",
            "aws_lambda_permission",
            "event_rule_lambda_permission",
        )

        self.assertEqual("${aws_cloudwatch_event_rule.this.arn}", permission["source_arn"])

    def test_sns_permission_is_scoped_to_its_topic(self):
        permission = resource_block(
            "lambda_function_sns",
            "aws_lambda_permission",
            "event_rule_lambda_permission",
        )

        self.assertEqual("${aws_sns_topic.this.arn}", permission["source_arn"])

    def test_api_gateway_permission_is_scoped_to_method_and_resource(self):
        permission = resource_block("api_gateway_method_to_lambda", "aws_lambda_permission", "this")

        self.assertEqual(
            "${var.rest_api.execution_arn}/*/${var.http_method}${var.resource.path}",
            permission["source_arn"],
        )


if __name__ == "__main__":
    unittest.main()
