resource "aws_ecs_cluster" "example" {
  name = "eops_tf_modules_example_ecs_task"

  tags = {
    Domain        = var.tag_domain
    Enviroment    = var.tag_environment
    "Cost Center" = var.tag_cost_center
  }
}

module "security_group" {
  source = "../../modules/security_group"
  
  name = "eops_tf_modules_example_ecs_task"
  vpc_id = data.aws_vpc.main.id
  egress_rules = [
    {
      from_port = 0
      to_port   = 0
      protocol  = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}