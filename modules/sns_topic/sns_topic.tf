resource "aws_sns_topic" "topic" {
  count = var.provision == true ? 1 : 0

  # Required
  tags = local.tags

  # Optional
  name                                     = var.sns_topic_name
  name_prefix                              = var.sns_topic_name_prefix
  display_name                             = var.sns_topic_display_name
  policy                                   = var.sns_topic_policy
  delivery_policy                          = var.sns_topic_delivery_policy
  application_success_feedback_role_arn    = var.sns_topic_application_success_feedback_role_arn
  application_success_feedback_sample_rate = var.sns_topic_application_success_feedback_sample_rate
  application_failure_feedback_role_arn    = var.sns_topic_application_failure_feedback_role_arn
  http_success_feedback_role_arn           = var.sns_topic_http_success_feedback_role_arn
  http_success_feedback_sample_rate        = var.sns_topic_http_success_feedback_sample_rate
  http_failure_feedback_role_arn           = var.sns_topic_http_failure_feedback_role_arn
  kms_master_key_id                        = var.sns_topic_kms_master_key_id
  lambda_success_feedback_role_arn         = var.sns_topic_lambda_success_feedback_role_arn
  lambda_success_feedback_sample_rate      = var.sns_topic_lambda_success_feedback_sample_rate
  lambda_failure_feedback_role_arn         = var.sns_topic_lambda_failure_feedback_role_arn
  sqs_success_feedback_role_arn            = var.sns_topic_sqs_success_feedback_role_arn
  sqs_success_feedback_sample_rate         = var.sns_topic_sqs_success_feedback_sample_rate
  sqs_failure_feedback_role_arn            = var.sns_topic_sqs_failure_feedback_role_arn

}

variable "sns_topic_name" {
  default = null
}
variable "sns_topic_name_prefix" {
  default = null
}
variable "sns_topic_display_name" {
  default = null
}
variable "sns_topic_policy" {
  default = null
}
variable "sns_topic_delivery_policy" {
  default = null
}
variable "sns_topic_application_success_feedback_role_arn" {
  default = null
}
variable "sns_topic_application_success_feedback_sample_rate" {
  default = null
}
variable "sns_topic_application_failure_feedback_role_arn" {
  default = null
}
variable "sns_topic_http_success_feedback_role_arn" {
  default = null
}
variable "sns_topic_http_success_feedback_sample_rate" {
  default = null
}
variable "sns_topic_http_failure_feedback_role_arn" {
  default = null
}
variable "sns_topic_kms_master_key_id" {
  default = null
}
variable "sns_topic_lambda_success_feedback_role_arn" {
  default = null
}
variable "sns_topic_lambda_success_feedback_sample_rate" {
  default = null
}
variable "sns_topic_lambda_failure_feedback_role_arn" {
  default = null
}
variable "sns_topic_sqs_success_feedback_role_arn" {
  default = null
}
variable "sns_topic_sqs_success_feedback_sample_rate" {
  default = null
}
variable "sns_topic_sqs_failure_feedback_role_arn" {
  default = null
}
