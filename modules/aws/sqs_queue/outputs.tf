output "sqs_queue" {
  value = var.provision == true ? aws_sqs_queue.queue[0] : null
}