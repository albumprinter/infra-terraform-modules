module "security_group" {
  source = "../../modules/security_group"

  name   = "infra_tf_modules_example_lambda_function"
  vpc_id = data.aws_vpc.main.id
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}
