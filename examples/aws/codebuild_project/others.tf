resource "aws_s3_bucket" "artifacts" {
  bucket = "infra-tf-modules-examples-codebuild-project-artifacts"

  tags = var.tags
}

module "security_group" {
  source = "../../../modules/aws/security_group"

  name   = "infra-tf-modules-examples-codebuild-project"
  vpc_id = data.aws_vpc.vpc.id
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = var.tags
}
