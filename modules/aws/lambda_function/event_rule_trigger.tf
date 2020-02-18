module "event_rule" {
  source    = "../event_rule"
  provision = (var.event_rule_event_pattern != null || var.event_rule_schedule_expression != null) && var.provision == true ? true : false

  #Required
  event_rule_event_pattern       = var.event_rule_event_pattern
  event_rule_schedule_expression = var.event_rule_schedule_expression
  tags                           = var.tags

  # Internally handled
  event_rule_name  = var.event_rule_name != null ? var.event_rule_name : var.function_name
  event_target_arn = length(aws_lambda_function.function) > 0 ? aws_lambda_function.function[0].arn : null

  # Optional
  event_rule_description = var.event_rule_description
  event_rule_name_prefix = var.event_rule_name_prefix
  event_rule_role_arn    = var.event_rule_role_arn
  event_rule_is_enabled  = var.event_rule_is_enabled

  event_target_target_id         = var.event_target_target_id
  event_target_input             = var.event_target_input
  event_target_input_path        = var.event_target_input_path
  event_target_role_arn          = var.event_target_role_arn
  event_target_input_transformer = var.event_target_input_transformer
}

resource "aws_lambda_permission" "event_rule_lambda_permission" {
  count = (var.event_rule_event_pattern != null || var.event_rule_schedule_expression != null) && var.provision == true ? 1 : 0

  # Required
  action        = var.event_rule_lambda_permission_action
  function_name = aws_lambda_function.function[0].function_name
  principal     = "events.amazonaws.com"

  # Optional
  event_source_token  = var.event_rule_lambda_permission_event_source_token
  qualifier           = var.event_rule_lambda_permission_qualifier
  source_account      = var.event_rule_lambda_permission_source_account
  source_arn          = var.event_rule_lambda_permission_source_arn
  statement_id        = var.event_rule_lambda_permission_statement_id
  statement_id_prefix = var.event_rule_lambda_permission_statement_id_prefix
}

# ----------------------- Variables -----------------------

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
variable "event_target_target_id" {
  default = null
}
variable "event_target_input" {
  default = null
}
variable "event_target_input_path" {
  default = null
}
variable "event_target_role_arn" {
  default = null
}
variable "event_target_input_transformer" {
  default = []
}
variable "event_rule_lambda_permission_action" {
  default = "lambda:InvokeFunction"
}
variable "event_rule_lambda_permission_event_source_token" {
  default = null
}
variable "event_rule_lambda_permission_qualifier" {
  default = null
}
variable "event_rule_lambda_permission_source_account" {
  default = null
}
variable "event_rule_lambda_permission_source_arn" {
  default = null
}
variable "event_rule_lambda_permission_statement_id" {
  default = null
}
variable "event_rule_lambda_permission_statement_id_prefix" {
  default = null
}