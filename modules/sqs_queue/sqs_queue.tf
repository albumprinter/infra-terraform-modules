resource "aws_sqs_queue" "queue" {
  count = var.provision == true ? 1 : 0

  # Optional
  content_based_deduplication       = var.content_based_deduplication
  delay_seconds                     = var.delay_seconds
  fifo_queue                        = var.fifo_queue
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  kms_master_key_id                 = var.kms_master_key_id
  message_retention_seconds         = var.message_retention_seconds
  max_message_size                  = var.max_message_size
  name                              = var.name
  name_prefix                       = var.name_prefix
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  redrive_policy                    = var.redrive_policy
  tags                              = local.tags
  visibility_timeout_seconds        = var.visibility_timeout_seconds
}

resource "aws_sqs_queue_policy" "policy" {
  count = var.provision == true && length(var.policy_statements) > 0 ? 1 : 0
  
  queue_url = aws_sqs_queue.queue[0].id

  policy = templatefile("${path.module}/templates/queue_policy.tpl", {
    policy_statements = var.policy_statements
    resource          = aws_sqs_queue.queue[0].arn
  })
}