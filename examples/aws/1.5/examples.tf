provider "aws" {
  region  = "eu-west-1"  
  
}

terraform {
  required_version = "1.5"

  required_providers {
    aws    = ">= 3.53.0"
   # local  = ">= 2.1"
   # random = ">= 3.1"
  }
}


module "ecs_fargate_task" {
  source       = "./ecs_fargate_task"
  project_name = local.project_name
  tags         = local.tags
}
