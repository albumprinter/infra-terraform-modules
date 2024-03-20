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


module "ecs_fargate_task" {
  source       = "./ecs_fargate_task"
  project_name = local.project_name
  tags         = local.tags
}
