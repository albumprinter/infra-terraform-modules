module "dead_letter_topic" {
  source    = "../sns_topic"
  provision = var.provision == true && var.function_dead_letter_target_type == "SNS" ? true : false

  #Required
  tags = var.tags

  # Internally handled
  sns_topic_name = local.function_dead_letter_target_name

  # Optional  
  sns_topic_policy                                   = var.dead_letter_topic_policy
  sns_topic_delivery_policy                          = var.dead_letter_topic_delivery_policy
  sns_topic_application_success_feedback_role_arn    = var.dead_letter_topic_application_success_feedback_role_arn
  sns_topic_application_success_feedback_sample_rate = var.dead_letter_topic_application_success_feedback_sample_rate
  sns_topic_application_failure_feedback_role_arn    = var.dead_letter_topic_application_failure_feedback_role_arn
  sns_topic_http_success_feedback_role_arn           = var.dead_letter_topic_http_success_feedback_role_arn
  sns_topic_http_success_feedback_sample_rate        = var.dead_letter_topic_http_success_feedback_sample_rate
  sns_topic_http_failure_feedback_role_arn           = var.dead_letter_topic_http_failure_feedback_role_arn
  sns_topic_kms_master_key_id                        = var.dead_letter_topic_kms_master_key_id
  sns_topic_lambda_success_feedback_role_arn         = var.dead_letter_topic_lambda_success_feedback_role_arn
  sns_topic_lambda_success_feedback_sample_rate      = var.dead_letter_topic_lambda_success_feedback_sample_rate
  sns_topic_lambda_failure_feedback_role_arn         = var.dead_letter_topic_lambda_failure_feedback_role_arn
  sns_topic_sqs_success_feedback_role_arn            = var.dead_letter_topic_sqs_success_feedback_role_arn
  sns_topic_sqs_success_feedback_sample_rate         = var.dead_letter_topic_sqs_success_feedback_sample_rate
  sns_topic_sqs_failure_feedback_role_arn            = var.dead_letter_topic_sqs_failure_feedback_role_arn
}

# ----------------------- Variables -----------------------

variable "dead_letter_topic_policy" {
  default = null
}
variable "dead_letter_topic_delivery_policy" {
  default = null
}
variable "dead_letter_topic_application_success_feedback_role_arn" {
  default = null
}
variable "dead_letter_topic_application_success_feedback_sample_rate" {
  default = null
}
variable "dead_letter_topic_application_failure_feedback_role_arn" {
  default = null
}
variable "dead_letter_topic_http_success_feedback_role_arn" {
  default = null
}
variable "dead_letter_topic_http_success_feedback_sample_rate" {
  default = null
}
variable "dead_letter_topic_http_failure_feedback_role_arn" {
  default = null
}
variable "dead_letter_topic_kms_master_key_id" {
  default = null
}
variable "dead_letter_topic_lambda_success_feedback_role_arn" {
  default = null
}
variable "dead_letter_topic_lambda_success_feedback_sample_rate" {
  default = null
}
variable "dead_letter_topic_lambda_failure_feedback_role_arn" {
  default = null
}
variable "dead_letter_topic_sqs_success_feedback_role_arn" {
  default = null
}
variable "dead_letter_topic_sqs_success_feedback_sample_rate" {
  default = null
}
variable "dead_letter_topic_sqs_failure_feedback_role_arn" {
  default = null
}