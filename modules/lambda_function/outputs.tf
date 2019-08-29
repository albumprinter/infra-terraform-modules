output "function" {
  value = aws_lambda_function.function
}
output "role" {
  value = module.role.role
}
output "log_group" {
  value = module.log_group.group
}

output "dead_letter_topic" {
  value = module.dead_letter_topic.sns_topic
}

output "dead_letter_queue" {
  value = module.dead_letter_queue.queue
}

output "event_rule" {
  value = module.event_rule.rule
}

output "api_gateway_rest_api" {
  value = module.api_gateway.rest_api
}
output "api_gateway_resource" {
  value = module.api_gateway.resource
}
output "api_gateway_method" {
  value = module.api_gateway.method
}
output "api_gateway_method_response" {
  value = module.api_gateway.method_response
}
output "api_gateway_integration" {
  value = module.api_gateway.integration
}
output "api_gateway_integration_response" {
  value = module.api_gateway.integration_response
}
output "api_gateway_deployment" {
  value = module.api_gateway.deployment
}
