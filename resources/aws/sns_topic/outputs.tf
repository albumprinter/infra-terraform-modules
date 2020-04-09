output "sns_topic" {
  value = var.provision == true && length(aws_sns_topic.topic) > 0 ? aws_sns_topic.topic[0] : null
}

output "sns_topic_subscription" {
  value = var.provision == true && var.sns_topic_subscription_protocol != null && length(aws_sns_topic_subscription.subscription) > 0 ? aws_sns_topic_subscription.subscription[0] : null
}
