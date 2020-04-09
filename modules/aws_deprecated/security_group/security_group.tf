resource "aws_security_group" "group" {
  # Required
  tags = merge(var.tags, {
    Name = var.name != null ? var.name : "Managed by Terraform"
  })

  # Optional
  name        = var.name
  name_prefix = var.name_prefix

  dynamic "ingress" {
    for_each = [for rule in var.ingress_rules : {
      protocol         = rule.protocol
      from_port        = rule.from_port
      to_port          = rule.to_port
      cidr_blocks      = lookup(rule, "cidr_blocks", null)
      ipv6_cidr_blocks = lookup(rule, "ipv6_cidr_blocks", null)
      prefix_list_ids  = lookup(rule, "prefix_list_ids", null)
      security_groups  = lookup(rule, "security_groups", null)
      self             = lookup(rule, "self", null)
      description      = lookup(rule, "description", null)
    }]

    content {
      protocol         = ingress.value.protocol
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      cidr_blocks      = ingress.value.cidr_blocks
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks
      prefix_list_ids  = ingress.value.prefix_list_ids
      security_groups  = ingress.value.security_groups
      self             = ingress.value.self
      description      = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = [for rule in var.egress_rules : {
      protocol         = rule.protocol
      from_port        = rule.from_port
      to_port          = rule.to_port
      cidr_blocks      = lookup(rule, "cidr_blocks", null)
      ipv6_cidr_blocks = lookup(rule, "ipv6_cidr_blocks", null)
      prefix_list_ids  = lookup(rule, "prefix_list_ids", null)
      security_groups  = lookup(rule, "security_groups", null)
      self             = lookup(rule, "self", null)
      description      = lookup(rule, "description", null)
    }]

    content {
      protocol         = egress.value.protocol
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      cidr_blocks      = egress.value.cidr_blocks
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
      prefix_list_ids  = egress.value.prefix_list_ids
      security_groups  = egress.value.security_groups
      self             = egress.value.self
      description      = egress.value.description
    }
  }

  description            = var.description
  revoke_rules_on_delete = var.revoke_rules_on_delete
  vpc_id                 = var.vpc_id
}

# -------------------- Variables --------------------
variable "name" {
  default = null
}
variable "name_prefix" {
  default = null
}
variable "description" {
  default = null
}
variable "revoke_rules_on_delete" {
  default = null
}
variable "vpc_id" {
  default = null
}
variable "ingress_rules" {
  type    = list
  default = []
}
variable "egress_rules" {
  type    = list
  default = []
}