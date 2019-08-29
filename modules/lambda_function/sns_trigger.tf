module "sns_trigger" {
  source    = "../sns_topic"
  provision = var.sns_trigger == true ? true : false

  # Internally handled
  sns_topic_name                  = var.sns_trigger_name != null ? var.sns_trigger_name : var.function_name
  sns_topic_subscription_protocol = "lambda"
  sns_topic_subscription_endpoint = aws_lambda_function.function.arn

  # Optional 
  sns_topic_policy                                   = var.sns_trigger_policy
  sns_topic_delivery_policy                          = var.sns_trigger_delivery_policy
  sns_topic_application_success_feedback_role_arn    = var.sns_trigger_application_success_feedback_role_arn
  sns_topic_application_success_feedback_sample_rate = var.sns_trigger_application_success_feedback_sample_rate
  sns_topic_application_failure_feedback_role_arn    = var.sns_trigger_application_failure_feedback_role_arn
  sns_topic_http_success_feedback_role_arn           = var.sns_trigger_http_success_feedback_role_arn
  sns_topic_http_success_feedback_sample_rate        = var.sns_trigger_http_success_feedback_sample_rate
  sns_topic_http_failure_feedback_role_arn           = var.sns_trigger_http_failure_feedback_role_arn
  sns_topic_kms_master_key_id                        = var.sns_trigger_kms_master_key_id
  sns_topic_lambda_success_feedback_role_arn         = var.sns_trigger_lambda_success_feedback_role_arn
  sns_topic_lambda_success_feedback_sample_rate      = var.sns_trigger_lambda_success_feedback_sample_rate
  sns_topic_lambda_failure_feedback_role_arn         = var.sns_trigger_lambda_failure_feedback_role_arn
  sns_topic_sqs_success_feedback_role_arn            = var.sns_trigger_sqs_success_feedback_role_arn
  sns_topic_sqs_success_feedback_sample_rate         = var.sns_trigger_sqs_success_feedback_sample_rate
  sns_topic_sqs_failure_feedback_role_arn            = var.sns_trigger_sqs_failure_feedback_role_arn

  sns_topic_subscription_endpoint_auto_confirms          = var.sns_trigger_subscription_endpoint_auto_confirms
  sns_topic_subscription_confirmation_timeout_in_minutes = var.sns_trigger_subscription_confirmation_timeout_in_minutes
  sns_topic_subscription_raw_message_delivery            = var.sns_trigger_subscription_raw_message_delivery
  sns_topic_subscription_filter_policy                   = var.sns_trigger_subscription_filter_policy
  sns_topic_subscription_delivery_policy                 = var.sns_trigger_subscription_delivery_policy

  #Required
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain      = var.tag_domain

  #Optional
  tag_others = var.tag_others
}

resource "aws_lambda_permission" "sns_trigger_lambda_permission" {
  count = var.sns_trigger == true ? 1 : 0

  # Required
  action = var.sns_trigger_lambda_permission_action

  # Internally handled
  function_name = aws_lambda_function.function.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = module.sns_trigger.sns_topic.arn

  # Optional
  event_source_token  = var.sns_trigger_lambda_permission_event_source_token
  qualifier           = var.sns_trigger_lambda_permission_qualifier
  source_account      = var.sns_trigger_lambda_permission_source_account
  statement_id        = var.sns_trigger_lambda_permission_statement_id
  statement_id_prefix = var.sns_trigger_lambda_permission_statement_id_prefix
}

# ----------------------- Variables -----------------------
variable "sns_trigger" {
  default = false
}
variable "sns_trigger_name" {
  default = null
}
variable "sns_trigger_policy" {
  default = null
}
variable "sns_trigger_delivery_policy" {
  default = null
}
variable "sns_trigger_application_success_feedback_role_arn" {
  default = null
}
variable "sns_trigger_application_success_feedback_sample_rate" {
  default = null
}
variable "sns_trigger_application_failure_feedback_role_arn" {
  default = null
}
variable "sns_trigger_http_success_feedback_role_arn" {
  default = null
}
variable "sns_trigger_http_success_feedback_sample_rate" {
  default = null
}
variable "sns_trigger_http_failure_feedback_role_arn" {
  default = null
}
variable "sns_trigger_kms_master_key_id" {
  default = null
}
variable "sns_trigger_lambda_success_feedback_role_arn" {
  default = null
}
variable "sns_trigger_lambda_success_feedback_sample_rate" {
  default = null
}
variable "sns_trigger_lambda_failure_feedback_role_arn" {
  default = null
}
variable "sns_trigger_sqs_success_feedback_role_arn" {
  default = null
}
variable "sns_trigger_sqs_success_feedback_sample_rate" {
  default = null
}
variable "sns_trigger_sqs_failure_feedback_role_arn" {
  default = null
}
variable "sns_trigger_subscription_endpoint_auto_confirms" {
  default = null
}
variable "sns_trigger_subscription_confirmation_timeout_in_minutes" {
  default = null
}
variable "sns_trigger_subscription_raw_message_delivery" {
  default = null
}
variable "sns_trigger_subscription_filter_policy" {
  default = null
}
variable "sns_trigger_subscription_delivery_policy" {
  default = null
}
variable "sns_trigger_lambda_permission_action" {
  default = "lambda:InvokeFunction"
}
variable "sns_trigger_lambda_permission_event_source_token" {
  default = null
}
variable "sns_trigger_lambda_permission_qualifier" {
  default = null
}
variable "sns_trigger_lambda_permission_source_account" {
  default = null
}
variable "sns_trigger_lambda_permission_source_arn" {
  default = null
}
variable "sns_trigger_lambda_permission_statement_id" {
  default = null
}
variable "sns_trigger_lambda_permission_statement_id_prefix" {
  default = null
}