terraform {
  required_version = ">= 1.5.2"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# Providers
provider "aws" {
  region = "eu-west-1"
}

variable "run_vpc_example" {
  type    = string
  default = true
}

module "ecr_repository" {
  source          = "./ecr_repository"
  project_name    = local.project_name
  organization_id = local.organization_id
  tags            = local.tags
}

module "ecs_fargate_task" {
  source       = "./ecs_fargate_task"
  project_name = local.project_name
  tags         = local.tags
}

module "lambda_function" {
  source          = "./lambda_function"
  project_name    = local.project_name
  tags            = local.tags
  run_vpc_example = var.run_vpc_example
}

module "lambda_function_event_rule" {
  source       = "./lambda_function_event_rule"
  project_name = local.project_name
  tags         = local.tags
}

module "lambda_function_sns" {
  source       = "./lambda_function_sns"
  project_name = local.project_name
  tags         = local.tags
}

module "lambda_function_sqs" {
  source       = "./lambda_function_sqs"
  project_name = local.project_name
  tags         = local.tags
}


module "sfn_state_machine" {
  source       = "./sfn_state_machine"
  project_name = local.project_name
  tags         = local.tags
}

module "sqs" {
  source       = "./sqs"
  project_name = local.project_name
  tags         = local.tags
}

