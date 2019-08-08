provider "aws" {
  region = "eu-west-1"
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

module "acm_certificate" {
  source = "./acm_certificate"  
}