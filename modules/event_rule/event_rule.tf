resource "aws_cloudwatch_event_rule" "rule" {
  count = var.provision == true ? 1 : 0

  # Required
  tags = local.tags

  #Conditionally Required
  event_pattern       = var.event_rule_event_pattern
  schedule_expression = var.event_rule_schedule_expression


  # Optional
  description = var.event_rule_description
  name        = var.event_rule_name
  name_prefix = var.event_rule_name_prefix
  role_arn    = var.event_rule_role_arn
  is_enabled  = var.event_rule_is_enabled
}

resource "aws_cloudwatch_event_target" "target" {
  count = var.provision == true ? 1 : 0

  # Required
  arn  = var.event_target_arn
  rule = aws_cloudwatch_event_rule.rule[0].name

  # Optional
  target_id  = var.event_target_target_id
  input      = var.event_target_input
  input_path = var.event_target_input_path
  role_arn   = var.event_target_role_arn

  dynamic "batch_target" {
    for_each = [for target in var.event_target_batch_target: {
      job_definition = target.job_definition
      job_name = target.job_name
      array_size = lookup(target, "array_size", null)
      job_attempts = lookup(target, "job_attempts", null)
    }]

    content {
      job_definition = batch_target.value.job_definition
      job_name = batch_target.value.job_name
      array_size = batch_target.value.array_size
      job_attempts = batch_target.value.job_attempts
    }
  }

  dynamic "ecs_target" {
    for_each = [for target in var.event_target_ecs_target: {
      task_definition_arn = target.task_definition_arn
      group  = lookup(target, "group", null)
      launch_type  = lookup(target, "launch_type", null)
      network_configuration_subnets  = lookup(target, "network_configuration_subnets", null)
      network_configuration_security_groups  = lookup(target, "network_configuration_security_groups", null)
      network_configuration_assign_public_ip  = lookup(target, "network_configuration_assign_public_ip", null)
      platform_version  = lookup(target, "platform_version", null)
      task_count  = lookup(target, "task_count", null)
    }]

    content {
      group       = ecs_target.value.task_definition_arn
      launch_type = ecs_target.value.group
      network_configuration {
        subnets          = ecs_target.value.launch_type
        security_groups  = ecs_target.value.network_configuration_subnets
        assign_public_ip = ecs_target.value.network_configuration_security_groups
      }
      platform_version    = ecs_target.value.network_configuration_assign_public_ip
      task_count          = ecs_target.value.platform_version
      task_definition_arn = ecs_target.value.task_count
    }
  }

  dynamic "input_transformer" {
    for_each = [for input in var.event_target_input_transformer: {
      input_template = input.input_template
      input_paths = lookup(input, "input_paths", null)
    }]

    content {
      input_paths    = input_transformer.value.input_paths
      input_template = input_transformer.value.input_template
    }
  }

  dynamic "kinesis_target" {
    for_each = [for target in var.event_target_kinesis_target: {
      partition_key_path = lookup(target, "partition_key_path", null)
    }]

    content {
      partition_key_path = kinesis_target.value.partition_key_path
    }
  }

  dynamic "run_command_targets" {
    for_each = [for target in var.event_target_run_command_targets: {
      key = target.key
      values = target.values
    }]

    content {
      key    = run_command_targets.value.key
      values = run_command_targets.value.values
    }
  }

  dynamic "sqs_target" {
    for_each = [for target in var.event_target_sqs_target: {
      message_group_id = lookup(target, "message_group_id", null)
    }]

    content {
      message_group_id = sqs_target.value.message_group_id
    }
  }
}
