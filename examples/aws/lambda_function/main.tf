module "lambda_function" {
  source = "../../../modules/aws/lambda_function"

  name       = "${var.project_name}Lambda"
  source_dir = "${path.module}/src"

  tags = var.tags
}

module "lambda_function_policy_statements" {
  source = "../../../modules/aws/lambda_function"

  name       = "${var.project_name}LambdaPolicyStatements"
  source_dir = "${path.module}/src"
  policy_statements = [
    {
      "Effect" : "Deny",
      "Action" : [
        "s3:ListBucket"
      ],
      "Resource" : ["*"]
    }
  ]

  tags = var.tags
}

# module "lambda_function_vpc" {
# source = "../../../modules/aws/lambda_function"
# 
# name       = "${var.project_name}LambdaVpc"
# source_dir = "${path.module}/src"
# vpc_config = {
# subnet_ids         = data.aws_subnet_ids.private.ids,
# security_group_ids = [aws_security_group.this.id]
# }
# 
# tags = var.tags
# }

module "lambda_function_environment" {
  source = "../../../modules/aws/lambda_function"

  name       = "${var.project_name}LambdaEnvironment"
  source_dir = "${path.module}/src"
  environment = {
    variables = {
      TEST = "test"
    }
  }
  error_actions_enabled = "false"

  tags = var.tags
}

resource "aws_sns_topic" "lambda_errors" {
  name = "${var.project_name}LambdaErrors"
}

module "lambda_function_alarm" {
  source = "../../../modules/aws/lambda_function"

  name       = "${var.project_name}LambdaErrorAlarm"
  source_dir = "${path.module}/src"
  environment = {
    variables = {
      TEST = "test"
    }
  }
  error_alarm_actions = [aws_sns_topic.lambda_errors.arn]

  tags = var.tags
}
