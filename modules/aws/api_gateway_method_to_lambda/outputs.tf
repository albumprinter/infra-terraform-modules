output "aws_api_gateway_method" {
  value = aws_api_gateway_method.this
}
output "aws_api_gateway_integration" {
  value = aws_api_gateway_integration.this
}
output "aws_lambda_permission" {
  value = aws_lambda_permission.this
}
output "aws_api_gateway_method_cors" {
  value = var.enable_cors && length(aws_api_gateway_method.cors) > 0 ? aws_api_gateway_method.cors[0] : null
}
output "aws_api_gateway_method_response_cors" {
  value = var.enable_cors && length(aws_api_gateway_method_response.cors) > 0 ? aws_api_gateway_method_response.cors[0] : null
}
output "aws_api_gateway_integration_cors" {
  value = var.enable_cors && length(aws_api_gateway_integration.cors) > 0 ? aws_api_gateway_integration.cors[0] : null
}
output "aws_api_gateway_integration_response_cors" {
  value = var.enable_cors && length(aws_api_gateway_integration_response.cors) > 0 ? aws_api_gateway_integration_response.cors[0] : null
}
