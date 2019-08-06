## ---------------- Shared ----------------
# Required
variable "tag_environment" {}

variable "tag_cost_center" {}

variable "tag_domain" {}

# Optional
variable "tag_others" {
  default = {}
}

## ---------------- ECS Task Definition ----------------
variable "task_family" {}
variable "task_container_definitions" {}
variable "task_role_arn" {
  default = null
}
variable "task_execution_role_arn" {
  default = null
}
variable "task_network_mode" {
  default = null
}
variable "task_ipc_mode" {
  default = null
}
variable "task_pid_mode" {
  default = null
}
variable "task_volumes" {
  default = []
}
variable "task_placement_constraints" {
  default = []
}
variable "task_cpu" {
  default = "256"
}
variable "task_memory" {
  default = "512"
}
variable "task_requires_compatibilities" {
  default = null
}
variable "task_proxy_configuration" {
  default = []
}

## ---------------- CloudWatch Log Group ----------------
variable "log_group_name" {
  default = null
}
variable "log_group_retention_in_days" {
  default = null
}
variable "log_group_kms_key_id" {
  default = null
}

## ---------------- Task IAM Role ----------------
variable "task_role_policy_statements" {
  type = "list"
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

## ---------------- Execution IAM Role ----------------
variable "execution_role_description" {
  default = null
}
variable "execution_role_force_detach_policies" {
  default = null
}
variable "execution_role_max_session_duration" {
  default = null
}
variable "execution_role_name" {
  default = null
}
variable "execution_role_name_prefix" {
  default = null
}
variable "execution_role_path" {
  default = null
}
variable "execution_role_permissions_boundary" {
  default = null
}
variable "execution_role_policy_description" {
  default = null
}
variable "execution_role_policy_name" {
  default = null
}
variable "execution_role_policy_name_prefix" {
  default = null
}
variable "execution_role_policy_path" {
  default = null
}