output "lambda_function" {
  value = aws_lambda_function.function[0]
}
output "iam_role" {
  value = module.role.iam_role
}
output "cloudwatch_log_group" {
  value = module.log_group.cloudwatch_log_group
}
output "cloudwatch_error_alarm" {
  value = module.error_alarm.cloudwatch_metric_alarm
}
output "dead_letter_topic" {
  value = module.dead_letter_topic.sns_topic
}
output "dead_letter_queue" {
  value = module.dead_letter_queue.sqs_queue
}
output "cloudwatch_event_rule" {
  value = module.event_rule.cloudwatch_event_rule
}
output "api_gateway_rest_api" {
  value = module.api_gateway.api_gateway_rest_api
}
output "api_gateway_resource" {
  value = module.api_gateway.api_gateway_resource
}
output "api_gateway_method" {
  value = module.api_gateway.api_gateway_method
}
output "api_gateway_method_response" {
  value = module.api_gateway.api_gateway_method_response
}
output "api_gateway_integration" {
  value = module.api_gateway.api_gateway_integration
}
output "api_gateway_integration_response" {
  value = module.api_gateway.api_gateway_integration_response
}
output "api_gateway_deployment" {
  value = module.api_gateway.api_gateway_deployment
}
output "sns_trigger_topic" {
  value = module.sns_trigger.sns_topic
}
output "sns_trigger_topic_subscription" {
  value = module.sns_trigger.sns_topic_subscription
}
