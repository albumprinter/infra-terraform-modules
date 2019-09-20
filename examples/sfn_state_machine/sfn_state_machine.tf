module "state_machine" {
  source = "../../modules/sfn_state_machine"

  sfn_state_machine_name       = "infra-tf-modules-examples-sfn-state-machine"
  sfn_state_machine_definition = <<EOF
{
  "Comment": "A Hello World example of the Amazon States Language using an AWS Lambda Function",
  "StartAt": "HelloWorld",
  "States": {
    "HelloWorld": {
      "Type": "Task",
      "Resource": "${module.lambda_function.lambda_function.arn}",
      "End": true
    }
  }
}
EOF

  iam_role_policy_statements = [
    {
      "Effect" : "Allow",
      "Action" : ["lambda:InvokeFunction"],
      "Resource" : [
        "${module.lambda_function.lambda_function.arn}"
      ]
    }
  ]

  tag_domain      = var.tag_domain
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
}

module "lambda_function" {
  source = "../../modules/lambda_function"

  function_name    = "infra-tf-modules-examples-sfn-state-machine-step"
  function_runtime = "python3.7"

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}
