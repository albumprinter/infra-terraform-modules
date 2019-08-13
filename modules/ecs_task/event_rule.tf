module "event_rule" {
  source = "../event_rule"
  provision = var.event_rule_event_pattern != null  || var.event_rule_schedule_expression != null ? true : false

  # Conditionally Required
  event_rule_event_pattern = var.event_rule_event_pattern
  event_rule_schedule_expression = var.event_rule_schedule_expression

  # Optional
  event_rule_description = var.event_rule_description
  event_rule_name = var.event_rule_name != null ? var.event_rule_name : var.task_family
  event_rule_name_prefix = var.event_rule_name_prefix
  event_rule_role_arn = var.event_rule_role_arn
  event_rule_is_enabled = var.event_rule_is_enabled

  # Required
  event_target_arn = var.event_target_arn
  event_target_ecs_target = [
    {
      task_definition_arn = aws_ecs_task_definition.task.arn
      group = var.event_target_group
      launch_type = var.event_target_launch_type
      network_configuration_subnets = var.event_target_network_configuration_subnets
      network_configuration_security_groups = var.event_target_network_configuration_security_groups
      network_configuration_assign_public_ip = var.event_target_network_configuration_assign_public_ip
      platform_version = var.event_target_platform_version
      task_count = var.event_target_task_count
    }
  ]
  
  # Optional
  event_target_target_id = var.event_target_target_id
  event_target_input = var.event_target_input
  event_target_input_path = var.event_target_input_path
  event_target_role_arn = module.event_rule_role.role.arn

  #Required
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain

  #Optional
  tag_others = var.tag_others
}

module "event_rule_role" {
  source = "../iam_role"
  provision = var.event_rule_event_pattern != null  || var.event_rule_schedule_expression != null ? true : false

  # Required  
  assume_role_principal = "events.amazonaws.com"
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain

  # Optional
  policy_statements = [
    {
      "Effect": "Allow",
      "Action": ["iam:PassRole"],
      "Resource": ["*"]
    },
    {
      "Effect": "Allow",
      "Action": ["ecs:RunTask"],
      "Resource": [replace(aws_ecs_task_definition.task.arn, "/:\\d+$/", ":*")]
    }
  ]

  role_description           = var.event_rule_iam_role_description
  role_force_detach_policies = var.event_rule_iam_role_force_detach_policies
  role_max_session_duration  = var.event_rule_iam_role_max_session_duration
  role_name                  = var.event_rule_iam_role_name != null ? var.event_rule_iam_role_name : var.task_family
  role_name_prefix           = var.event_rule_iam_role_name_prefix
  role_path                  = var.event_rule_iam_role_path
  role_permissions_boundary  = var.event_rule_iam_role_permissions_boundary
  policy_description         = var.event_rule_iam_role_policy_description
  policy_name                = var.event_rule_iam_role_policy_name != null ? var.event_rule_iam_role_policy_name : var.task_family
  policy_name_prefix         = var.event_rule_iam_role_policy_name_prefix
  policy_path                = var.event_rule_iam_role_policy_path
  tag_others                 = var.tag_others
}