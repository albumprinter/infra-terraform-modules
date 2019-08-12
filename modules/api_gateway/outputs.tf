output "rest_api" {
  value = aws_api_gateway_rest_api.api
}
output "resource" {
  value = aws_api_gateway_resource.resource
}
output "method" {
  value = aws_api_gateway_method.method
}
output "method_response" {
  value = aws_api_gateway_method_response.method_response
}
output "integration" {
  value = aws_api_gateway_integration.integration
}
output "integration_response" {
  value = aws_api_gateway_integration_response.integration_response
}
output "deployment" {
  value = aws_api_gateway_deployment.deployment
}
output "api_key" {
  value = aws_api_gateway_api_key.key
}
output "usage_plan" {
  value = aws_api_gateway_usage_plan.plan
}
output "usage_plan_key" {
  value = aws_api_gateway_usage_plan_key.key
}