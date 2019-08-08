resource "aws_route53_zone" "zone" {
  name = var.zone_name
  comment = var.zone_comment
  delegation_set_id =  var.zone_delegation_set_id
  force_destroy = var.zone_force_destroy
  tags = local.tags
  
  dynamic "vpc" {
    for_each = [for config in var.zone_vpc: {
      vpc_id = config.vpc_id
      vpc_region = lookup(config, "vpc_region", null)
    }]

    content {
      vpc_id = vpc.value.protocol
      vpc_region = vpc.value.from_port
    }
  }
}
