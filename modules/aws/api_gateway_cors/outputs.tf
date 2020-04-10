output "aws_api_gateway_method" {
  value = aws_api_gateway_method.this
}
output "aws_api_gateway_method_response_http_200" {
  value = aws_api_gateway_method_response.http_200
}
output "aws_api_gateway_method_response_http_400" {
  value = aws_api_gateway_method_response.http_400
}
output "aws_api_gateway_integration" {
  value = aws_api_gateway_integration.this
}
output "aws_api_gateway_integration_response_http_200" {
  value = aws_api_gateway_integration_response.http_200
}
output "aws_api_gateway_integration_response_http_400" {
  value = aws_api_gateway_integration_response.http_400
}
