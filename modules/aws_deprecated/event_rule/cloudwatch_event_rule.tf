resource "aws_cloudwatch_event_rule" "rule" {
  count = var.provision == true ? 1 : 0

  # Required  
  event_pattern       = var.event_rule_event_pattern
  schedule_expression = var.event_rule_schedule_expression
  tags                = var.tags

  # Optional
  description = var.event_rule_description
  name        = var.event_rule_name
  name_prefix = var.event_rule_name_prefix
  role_arn    = var.event_rule_role_arn
  is_enabled  = var.event_rule_is_enabled
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
