resource "aws_route53_zone" "zone" {
  # Required
  name = var.zone_name
  tags = merge(var.tags, {
    Name = var.zone_name
  })

  # Optional
  comment           = var.zone_comment
  delegation_set_id = var.zone_delegation_set_id
  force_destroy     = var.zone_force_destroy

  dynamic "vpc" {
    for_each = [for config in var.zone_vpc : {
      vpc_id     = config.vpc_id
      vpc_region = lookup(config, "vpc_region", null)
    }]

    content {
      vpc_id     = vpc.value.protocol
      vpc_region = vpc.value.from_port
    }
  }
}

# -------------------- Variables --------------------
variable "zone_name" {}
variable "zone_comment" {
  default = null
}
variable "zone_delegation_set_id" {
  default = null
}
variable "zone_force_destroy" {
  default = null
}
variable "zone_vpc" {
  default = []
}
variable "prevent_destroy" {
  default = true
}
