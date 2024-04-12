terraform {
  required_version = ">= 1.5.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Providers
provider "aws" {
  region = "eu-west-1"
}

module "config_custom_rule" {
  source       = "./config_custom_rule"
  project_name = local.project_name
  tags         = local.tags
}

# module "ecs_fargate_task" {
#   source       = "./ecs_fargate_task"
#   project_name = local.project_name
#   tags         = local.tags
# }

# module "lambda_function" {
#   source       = "./lambda_function"
#   project_name = local.project_name
#   tags         = local.tags
# }

# module "lambda_function_event_rule" {
#   source       = "./lambda_function_event_rule"
#   project_name = local.project_name
#   tags         = local.tags
# }

# module "lambda_function_sns" {
#  source       = "./lambda_function_sns"
#  project_name = local.project_name
#  tags         = local.tags
# }

# module "lambda_function_sqs" {
#   source       = "./lambda_function_sqs"
#   project_name = local.project_name
#   tags         = local.tags
# }
