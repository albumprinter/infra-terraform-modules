provider "aws" {
  region  = "eu-west-1"
  version = "~> 2.17"
}

module "lambda_function" {
  source = "./lambda_function"

  tags = local.tags
}

module "ecs_task" {
  source = "./ecs_task"

  tags = local.tags
}

module "route53_hosted_zone" {
  source = "./route53_hosted_zone"

  tags = local.tags
}

module "ecr_repository" {
  source = "./ecr_repository"

  tags = local.tags
}

module "sqs_queue" {
  source = "./sqs_queue"

  tags = local.tags
}

module "config_config_rule" {
  source = "./config_config_rule"

  tags = local.tags
}

module "sfn_state_machine" {
  source = "./sfn_state_machine"

  tags = local.tags
}