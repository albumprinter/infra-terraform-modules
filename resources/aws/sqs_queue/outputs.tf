output "sqs_queue" {
  value = var.provision == true && length(aws_sqs_queue.queue) > 0 ? aws_sqs_queue.queue[0] : null
}
