provider "aws" {
  region  = "eu-west-1"
  version = "~> 2.35"
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

module "cloudwatch_metric_alarm" {
  source = "./cloudwatch_metric_alarm"

  tags = local.tags
}

module "codebuild_project" {
  source = "./codebuild_project"

  tags = local.tags
}

module "glue_crawler" {
  source = "./glue_crawler"

  tags = local.tags
}