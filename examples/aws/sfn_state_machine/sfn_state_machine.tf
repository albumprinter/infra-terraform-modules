module "state_machine" {
  source = "../../../modules/aws/sfn_state_machine"

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

  tags = var.tags
}

module "lambda_function" {
  source = "../../../modules/aws/lambda_function"

  function_name    = "infra-tf-modules-examples-sfn-state-machine-step"
  function_runtime = "python3.7"

  tags = var.tags
}
