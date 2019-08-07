provider "aws" {
  region = "eu-west-1"
}

module "lambda_function" {
  source = "./lambda_function"  
}

module "ecs_task" {
  source = "./ecs_task"  
}

module "route53_zone" {
  source = "./route53_zone"  
}