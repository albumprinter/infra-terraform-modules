provider "aws" {
  region  = "eu-west-1"
  version = "~> 2.17"
}

module "lambda_function" {
  source = "./lambda_function"
}

module "ecs_task" {
  source = "./ecs_task"
}

module "route53_hosted_zone" {
  source = "./route53_hosted_zone"
}

module "ecr_repository" {
  source = "./ecr_repository"
}

module "sqs_queue" {
  source = "./sqs_queue"
}

module "config_config_rule" {
  source = "./config_config_rule"
}