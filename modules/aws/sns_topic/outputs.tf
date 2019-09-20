output "sns_topic" {
  value = aws_sns_topic.topic[0]
}

output "sns_topic_subscription" {
  value = aws_sns_topic_subscription.subscription[0]
}
