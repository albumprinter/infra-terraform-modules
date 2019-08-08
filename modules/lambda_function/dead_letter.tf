module "dead_letter_queue" {
  source  = "../sqs_queue"
  provision = var.function_dead_letter_target_type == "SQS" ? true : false

  # Optional
  name                              = local.function_dead_letter_target_name
  content_based_deduplication       = var.sqs_queue_content_based_deduplication
  delay_seconds                     = var.sqs_queue_delay_seconds
  fifo_queue                        = var.sqs_queue_fifo_queue
  kms_data_key_reuse_period_seconds = var.sqs_queue_kms_data_key_reuse_period_seconds
  kms_master_key_id                 = var.sqs_queue_kms_master_key_id
  message_retention_seconds         = var.sqs_queue_message_retention_seconds
  max_message_size                  = var.sqs_queue_max_message_size
  policy                            = var.sqs_queue_policy
  receive_wait_time_seconds         = var.sqs_queue_receive_wait_time_seconds
  redrive_policy                    = var.sqs_queue_redrive_policy
  visibility_timeout_seconds        = var.sqs_queue_visibility_timeout_seconds

  #Required
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain

  #Optional
  tag_others = var.tag_others
}

module "dead_letter_topic" {
  source  = "../sns_topic"
  provision = var.function_dead_letter_target_type == "SNS" ? true : false

  # Optional
  name                                     = local.function_dead_letter_target_name
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

  #Required
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain
  
  #Optional
  tag_others = var.tag_others
}
