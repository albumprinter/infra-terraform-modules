module "iam_role" {
  source = "../iam_role"

  # Required  
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain      = var.tag_domain

  # Internally handled
  assume_role_principal = "states.amazonaws.com"

  # Optional  
  role_description           = var.iam_role_description
  role_force_detach_policies = var.iam_role_force_detach_policies
  role_max_session_duration  = var.iam_role_max_session_duration
  role_name                  = var.iam_role_name != null ? var.iam_role_name : var.sfn_state_machine_name
  role_name_prefix           = var.iam_role_name_prefix
  role_path                  = var.iam_role_path
  role_permissions_boundary  = var.iam_role_permissions_boundary

  policy_statements  = var.iam_role_policy_statements
  policy_description = var.iam_role_policy_description
  policy_name        = var.iam_role_policy_name != null ? var.iam_role_policy_name : var.sfn_state_machine_name
  policy_name_prefix = var.iam_role_policy_name_prefix
  policy_path        = var.iam_role_policy_path

  tag_others = var.tag_others
}

# -------------------- Variables --------------------

variable "iam_role_policy_statements" {
  type    = "list"
  default = []
}
variable "iam_role_description" {
  default = null
}
variable "iam_role_force_detach_policies" {
  default = null
}
variable "iam_role_max_session_duration" {
  default = null
}
variable "iam_role_name" {
  default = null
}
variable "iam_role_name_prefix" {
  default = null
}
variable "iam_role_path" {
  default = null
}
variable "iam_role_permissions_boundary" {
  default = null
}
variable "iam_role_policy_description" {
  default = null
}
variable "iam_role_policy_name" {
  default = null
}
variable "iam_role_policy_name_prefix" {
  default = null
}
variable "iam_role_policy_path" {
  default = null
}