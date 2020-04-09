module "lambda_function" {
  source = "../../../modules/aws/lambda_function"

  function_name    = "infra-tf-modules-examples-lambda-function"
  function_runtime = var.function_runtime_nodejs

  tags = var.tags

  iam_role_policy_statements = var.iam_role_policy_statements
}

# module "lambda_function_vpc" {
#   source = "../../../modules/aws/lambda_function"

#   function_name    = "infra-tf-modules-examples-lambda-function-vpc"
#   function_runtime = var.function_runtime_dotnetcore

#   tags = var.tags

#   iam_role_policy_statements = var.iam_role_policy_statements

#   function_vpc_config = [
#     {
#       subnet_ids         = data.aws_subnet_ids.private.ids,
#       security_group_ids = [module.security_group.security_group.id]
#     }
#   ]
# }

module "lambda_function_sns" {
  source = "../../../modules/aws/lambda_function"

  function_name    = "infra-tf-modules-examples-lambda-function-sns"
  function_runtime = var.function_runtime_python

  tags = var.tags

  function_dead_letter_target_type = "SNS"
}

# module "lambda_function_sns_vpc" {
#   source = "../../../modules/aws/lambda_function"

#   function_name    = "infra-tf-modules-examples-lambda-function-sns-vpc"
#   function_runtime = var.function_runtime_nodejs

#   tags = var.tags

#   function_dead_letter_target_type = "SNS"

#   function_vpc_config = [
#     {
#       subnet_ids         = data.aws_subnet_ids.private.ids,
#       security_group_ids = [module.security_group.security_group.id]
#     }
#   ]
# }

module "lambda_function_scheduled" {
  source = "../../../modules/aws/lambda_function"

  function_name    = "infra-tf-modules-examples-lambda-function-scheduled"
  function_runtime = var.function_runtime_nodejs

  tags = var.tags

  event_rule_schedule_expression = "cron(0 2 * * ? *)"
}

# module "lambda_function_scheduled_vpc" {
#   source = "../../../modules/aws/lambda_function"

#   function_name    = "infra-tf-modules-examples-lambda-function-scheduled-vpc"
#   function_runtime = var.function_runtime_python

#   tags = var.tags

#   event_rule_schedule_expression = "cron(0 2 * * ? *)"

#   function_vpc_config = [
#     {
#       subnet_ids         = data.aws_subnet_ids.private.ids,
#       security_group_ids = [module.security_group.security_group.id]
#     }
#   ]
# }

module "lambda_function_event_pattern" {
  source = "../../../modules/aws/lambda_function"

  function_name    = "infra-tf-modules-examples-lambda-function-event-pattern"
  function_runtime = var.function_runtime_dotnetcore

  tags = var.tags

  event_rule_event_pattern = <<PATTERN
{
  "detail-type": [
    "AWS Console Sign In via CloudTrail"
  ]
}
PATTERN
}

# module "lambda_function_event_pattern_vpc" {
#   source = "../../../modules/aws/lambda_function"

#   function_name    = "infra-tf-modules-examples-lambda-function-event-pattern-vpc"
#   function_runtime = var.function_runtime_python

#   tags = var.tags

#   event_rule_event_pattern = <<PATTERN
# {
#   "detail-type": [
#     "AWS Console Sign In via CloudTrail"
#   ]
# }
# PATTERN

#   function_vpc_config = [
#     {
#       subnet_ids         = data.aws_subnet_ids.private.ids,
#       security_group_ids = [module.security_group.security_group.id]
#     }
#   ]
# }

module "lambda_function_api_gateway" {
  source = "../../../modules/aws/lambda_function"

  function_name    = "infra-tf-modules-examples-lambda-function-api-gateway"
  function_runtime = var.function_runtime_dotnetcore

  tags = var.tags

  api_gateway_rest_api_name         = "lambda_function_api_gateway"
  api_gateway_deployment_stage_name = "test"
  api_gateway_resource_path_part    = "{proxy+}"
}

module "lambda_function_environment_variables" {
  source = "../../../modules/aws/lambda_function"

  function_name    = "infra-tf-modules-examples-lambda-function-environment-variables"
  function_runtime = var.function_runtime_nodejs

  tags = var.tags

  function_environment = [
    {
      variables = {
        TEST = "test"
      }
    }
  ]
}

module "lambda_function_sns_trigger" {
  source = "../../../modules/aws/lambda_function"

  function_name    = "infra-tf-modules-examples-lambda-function-sns-trigger"
  function_runtime = var.function_runtime_nodejs

  tags = var.tags

  sns_trigger = true
}
