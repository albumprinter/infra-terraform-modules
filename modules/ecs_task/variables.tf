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
  default = 30
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

## ---------------- CloudWatch Event Rule ----------------
variable "event_rule_event_pattern" {
  default = null
}
variable "event_rule_schedule_expression" {
  default = null
}
variable "event_rule_description" {
  default = null
}
variable "event_rule_name" {
  default = null
}
variable "event_rule_name_prefix" {
  default = null
}
variable "event_rule_role_arn" {
  default = null
}
variable "event_rule_is_enabled" {
  default = null
}

## ---------------- CloudWatch Event Target ----------------
variable "event_target_arn" {
  default = null
}
variable "event_target_group" {
  default = null
}
variable "event_target_launch_type" {
  default = null
}
variable "event_target_network_configuration_subnets" {
  default = null
}
variable "event_target_network_configuration_security_groups" {
  default = null
}
variable "event_target_network_configuration_assign_public_ip" {
  default = false
}
variable "event_target_platform_version" {
  default = null
}
variable "event_target_task_count" {
  default = 1
}
variable "event_target_target_id" {
  default = null
}
variable "event_target_input" {
  default = null
}
variable "event_target_input_path" {
  default = null
}

## ---------------- CloudWatch Event Rule IAM Role ----------------
variable "event_rule_iam_role_description" {
  default = null
}
variable "event_rule_iam_role_force_detach_policies" {
  default = null
}
variable "event_rule_iam_role_max_session_duration" {
  default = null
}
variable "event_rule_iam_role_name" {
  default = null
}
variable "event_rule_iam_role_name_prefix" {
  default = null
}
variable "event_rule_iam_role_path" {
  default = null
}
variable "event_rule_iam_role_permissions_boundary" {
  default = null
}
variable "event_rule_iam_role_policy_description" {
  default = null
}
variable "event_rule_iam_role_policy_name" {
  default = null
}
variable "event_rule_iam_role_policy_name_prefix" {
  default = null
}
variable "event_rule_iam_role_policy_path" {
  default = null
}