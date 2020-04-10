module "task_role" {
  source = "../iam_role"

  # Required  
  tags = var.tags

  # Internally handled
  assume_role_principal = "ecs-tasks.amazonaws.com"

  # Optional
  policy_statements          = var.task_role_policy_statements
  role_description           = var.task_role_description
  role_force_detach_policies = var.task_role_force_detach_policies
  role_max_session_duration  = var.task_role_max_session_duration
  role_name                  = var.task_role_name != null ? var.task_role_name : "${var.task_family}_task"
  role_name_prefix           = var.task_role_name_prefix
  role_path                  = var.task_role_path
  role_permissions_boundary  = var.task_role_permissions_boundary

  policy_description = var.task_role_policy_description
  policy_name        = var.task_role_policy_name != null ? var.task_role_policy_name : "${var.task_family}_task"
  policy_name_prefix = var.task_role_policy_name_prefix
  policy_path        = var.task_role_policy_path
}

# -------------------- Variables --------------------

variable "task_role_policy_statements" {
  type    = list
  default = []
}
variable "task_role_description" {
  default = null
}
variable "task_role_force_detach_policies" {
  default = null
}
variable "task_role_max_session_duration" {
  default = null
}
variable "task_role_name" {
  default = null
}
variable "task_role_name_prefix" {
  default = null
}
variable "task_role_path" {
  default = null
}
variable "task_role_permissions_boundary" {
  default = null
}
variable "task_role_policy_description" {
  default = null
}
variable "task_role_policy_name" {
  default = null
}
variable "task_role_policy_name_prefix" {
  default = null
}
variable "task_role_policy_path" {
  default = null
}