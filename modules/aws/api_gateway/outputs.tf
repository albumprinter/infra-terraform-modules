output "api_gateway_rest_api" {
  value = aws_api_gateway_rest_api.api
}
output "api_gateway_resource" {
  value = aws_api_gateway_resource.resource
}
output "api_gateway_method" {
  value = aws_api_gateway_method.method
}
output "api_gateway_method_response" {
  value = aws_api_gateway_method_response.method_response
}
output "api_gateway_integration" {
  value = aws_api_gateway_integration.integration
}
output "api_gateway_integration_response" {
  value = aws_api_gateway_integration_response.integration_response
}
output "api_gateway_deployment" {
  value = aws_api_gateway_deployment.deployment
}
output "api_gateway_api_key" {
  value = aws_api_gateway_api_key.key
}
output "api_gateway_usage_plan" {
  value = aws_api_gateway_usage_plan.plan
}
output "api_gateway_usage_plan_key" {
  value = aws_api_gateway_usage_plan_key.key
}