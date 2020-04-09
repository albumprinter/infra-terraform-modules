module "event_rule" {
  source    = "../event_rule"
  provision = var.event_rule_event_pattern != null || var.event_rule_schedule_expression != null ? true : false

  # Required
  event_rule_event_pattern       = var.event_rule_event_pattern
  event_rule_schedule_expression = var.event_rule_schedule_expression
  event_target_arn               = var.event_target_arn
  event_target_ecs_target = [
    {
      task_definition_arn                    = aws_ecs_task_definition.task.arn
      group                                  = var.event_target_group
      launch_type                            = var.event_target_launch_type
      network_configuration_subnets          = var.event_target_network_configuration_subnets
      network_configuration_security_groups  = var.event_target_network_configuration_security_groups
      network_configuration_assign_public_ip = var.event_target_network_configuration_assign_public_ip
      platform_version                       = var.event_target_platform_version
      task_count                             = var.event_target_task_count
    }
  ]
  tags = var.tags

  # Interally handled
  event_rule_name       = var.event_rule_name != null ? var.event_rule_name : var.task_family
  event_target_role_arn = module.event_rule_role.iam_role != null ? module.event_rule_role.iam_role.arn : null

  # Optional
  event_rule_description = var.event_rule_description
  event_rule_name_prefix = var.event_rule_name_prefix
  event_rule_role_arn    = var.event_rule_role_arn
  event_rule_is_enabled  = var.event_rule_is_enabled

  event_target_target_id  = var.event_target_target_id
  event_target_input      = var.event_target_input
  event_target_input_path = var.event_target_input_path
}

module "event_rule_role" {
  source    = "../iam_role"
  provision = var.event_rule_event_pattern != null || var.event_rule_schedule_expression != null ? true : false

  # Required  
  tags = var.tags

  # Interally handled
  assume_role_principal = "events.amazonaws.com"
  policy_statements = [
    {
      "Effect" : "Allow",
      "Action" : ["iam:PassRole"],
      "Resource" : ["*"]
    },
    {
      "Effect" : "Allow",
      "Action" : ["ecs:RunTask"],
      "Resource" : [replace(aws_ecs_task_definition.task.arn, "/:\\d+$/", ":*")]
    }
  ]

  # Optional
  role_description           = var.event_rule_iam_role_description
  role_force_detach_policies = var.event_rule_iam_role_force_detach_policies
  role_max_session_duration  = var.event_rule_iam_role_max_session_duration
  role_name                  = var.event_rule_iam_role_name != null ? var.event_rule_iam_role_name : var.task_family
  role_name_prefix           = var.event_rule_iam_role_name_prefix
  role_path                  = var.event_rule_iam_role_path
  role_permissions_boundary  = var.event_rule_iam_role_permissions_boundary

  policy_description = var.event_rule_iam_role_policy_description
  policy_name        = var.event_rule_iam_role_policy_name != null ? var.event_rule_iam_role_policy_name : var.task_family
  policy_name_prefix = var.event_rule_iam_role_policy_name_prefix
  policy_path        = var.event_rule_iam_role_policy_path
}

# -------------------- Variables --------------------

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