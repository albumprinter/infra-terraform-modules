resource "aws_iam_role" "role" {
  count = var.provision == true ? 1 : 0

  # Required
  assume_role_policy = templatefile("${path.module}/templates/assume_role_policy.tpl", {
    principal_type   = var.assume_role_principal_type,
    principal_target = var.assume_role_principal
  })

  # Optional
  description           = var.role_description
  force_detach_policies = var.role_force_detach_policies
  max_session_duration  = var.role_max_session_duration
  name                  = substr(var.role_name, 0, 64)
  name_prefix           = var.role_name_prefix
  path                  = var.role_path
  permissions_boundary  = var.role_permissions_boundary
  tags                  = var.tags
}

# -------------------- Variables --------------------
variable "assume_role_principal" {}
variable "assume_role_principal_type" {
  default = "Service"
}

variable "role_description" {
  default = null
}

variable "role_force_detach_policies" {
  default = null
}

variable "role_max_session_duration" {
  default = null
}

variable "role_name" {
  default = null
}

variable "role_name_prefix" {
  default = null
}

variable "role_path" {
  default = null
}

variable "role_permissions_boundary" {
  default = null
}