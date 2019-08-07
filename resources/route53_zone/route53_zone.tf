resource "aws_route53_zone" "zone" {
  name = var.name
  comment = var.comment 
  delegation_set_id = var.delegation_set_id
  force_destroy = var.force_destroy
  tags = var.tags
  
  dynamic "vpc" {
    for_each = [for config in var.vpc: {
      vpc_id = config.vpc_id
      vpc_region = lookup(config, "vpc_region", null)
    }]

    content {
      vpc_id = vpc.value.protocol
      vpc_region = vpc.value.from_port
    }
  }
}