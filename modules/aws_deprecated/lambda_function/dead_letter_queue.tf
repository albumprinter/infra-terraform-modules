module "dead_letter_queue" {
  source    = "../sqs_queue"
  provision = var.provision == true && var.function_dead_letter_target_type == "SQS" ? true : false

  #Required
  tags = var.tags

  # Internally handled
  name = local.function_dead_letter_target_name
  policy_statements = [
    {
      "Effect" : "Allow",
      "Action" : ["sqs:SendMessage"],
      "Condition" : {
        "ArnEquals" : {
          "aws:SourceArn" : length(aws_lambda_function.function) > 0 ? aws_lambda_function.function[0].arn : null
        }
      }
    }
  ]

  # Optional  
  content_based_deduplication       = var.dead_letter_queue_content_based_deduplication
  delay_seconds                     = var.dead_letter_queue_delay_seconds
  fifo_queue                        = var.dead_letter_queue_fifo_queue
  kms_data_key_reuse_period_seconds = var.dead_letter_queue_kms_data_key_reuse_period_seconds
  kms_master_key_id                 = var.dead_letter_queue_kms_master_key_id
  message_retention_seconds         = var.dead_letter_queue_message_retention_seconds
  max_message_size                  = var.dead_letter_queue_max_message_size
  receive_wait_time_seconds         = var.dead_letter_queue_receive_wait_time_seconds
  redrive_policy                    = var.dead_letter_queue_redrive_policy
  visibility_timeout_seconds        = var.dead_letter_queue_visibility_timeout_seconds
}

# ----------------------- Variables -----------------------

variable "dead_letter_queue_content_based_deduplication" {
  default = null
}
variable "dead_letter_queue_delay_seconds" {
  default = null
}
variable "dead_letter_queue_fifo_queue" {
  default = null
}
variable "dead_letter_queue_kms_data_key_reuse_period_seconds" {
  default = null
}
variable "dead_letter_queue_kms_master_key_id" {
  default = null
}
variable "dead_letter_queue_message_retention_seconds" {
  default = null
}
variable "dead_letter_queue_max_message_size" {
  default = null
}
variable "dead_letter_queue_policy" {
  default = null
}
variable "dead_letter_queue_receive_wait_time_seconds" {
  default = null
}
variable "dead_letter_queue_redrive_policy" {
  default = null
}
variable "dead_letter_queue_visibility_timeout_seconds" {
  default = null
}

