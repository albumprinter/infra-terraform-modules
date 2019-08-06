module "event_rule" {
  source  = "../../resources/cloudwatch_event_rule"
  provision = var.provision

  # Required
  tags = local.tags

  # Conditionally Required
  event_pattern       = var.event_rule_event_pattern
  schedule_expression = var.event_rule_schedule_expression

  # Optional
  description = var.event_rule_description
  name        = var.event_rule_name
  name_prefix = var.event_rule_name_prefix
  role_arn    = var.event_rule_role_arn
  is_enabled  = var.event_rule_is_enabled
}

module "event_target" {
  source  = "../../resources/cloudwatch_event_target"
  provision = var.provision

  # Required
  arn  = var.event_target_arn
  rule = module.event_rule.resource.name

  # Optional
  target_id                         = var.event_target_target_id
  input                             = var.event_target_input
  input_path                        = var.event_target_input_path
  role_arn                          = var.event_target_role_arn
  batch_target = var.event_target_batch_target
  ecs_target = var.event_target_ecs_target
  input_transformer = var.event_target_input_transformer
  kinesis_target = var.event_target_kinesis_target
  run_command_targets = var.event_target_run_command_targets
  sqs_target = var.event_target_sqs_target
}
