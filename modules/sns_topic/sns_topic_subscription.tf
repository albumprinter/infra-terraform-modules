resource "aws_sns_topic_subscription" "subscription" {
  count = var.provision == true && var.sns_topic_subscription_protocol != null ? 1 : 0

  # Required  
  protocol = var.sns_topic_subscription_protocol
  endpoint = var.sns_topic_subscription_endpoint 

  # Internally handled
  topic_arn = aws_sns_topic.topic[0].arn

  # Optional
  endpoint_auto_confirms = var.sns_topic_subscription_endpoint_auto_confirms
  confirmation_timeout_in_minutes = var.sns_topic_subscription_confirmation_timeout_in_minutes
  raw_message_delivery = var.sns_topic_subscription_raw_message_delivery
  filter_policy = var.sns_topic_subscription_filter_policy
  delivery_policy = var.sns_topic_subscription_delivery_policy
}

variable "sns_topic_subscription_protocol" {
  default = null
}
variable "sns_topic_subscription_endpoint" {
  default = null
}
variable "sns_topic_subscription_endpoint_auto_confirms" {
  default = null
}
variable "sns_topic_subscription_confirmation_timeout_in_minutes" {
  default = null
}
variable "sns_topic_subscription_raw_message_delivery" {
  default = null
}
variable "sns_topic_subscription_filter_policy" {
  default = null
}
variable "sns_topic_subscription_delivery_policy" {
  default = null
}
