resource "aws_api_gateway_method" "this" {
  rest_api_id          = var.rest_api.id
  resource_id          = var.resource.id
  http_method          = var.http_method
  authorization        = var.authorization
  authorizer_id        = local.authorizer_id
  request_validator_id = var.request_validator_id
  request_parameters   = var.request_parameters
  request_models       = var.request_models
}

resource "aws_api_gateway_integration" "this" {
  rest_api_id             = var.rest_api.id
  resource_id             = var.resource.id
  http_method             = aws_api_gateway_method.this.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_function.invoke_arn
}

resource "aws_lambda_permission" "this" {
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.rest_api.execution_arn}/*/*/*"
}

resource "aws_api_gateway_method" "cors" {
  count         = var.enable_cors ? 1 : 0
  rest_api_id   = var.rest_api.id
  resource_id   = var.resource.id
  http_method   = "OPTIONS"
  authorization = "NONE"
  authorizer_id = local.authorizer_id
}

resource "aws_api_gateway_method_response" "cors" {
  count       = var.enable_cors ? 1 : 0
  rest_api_id = var.rest_api.id
  resource_id = var.resource.id
  http_method = aws_api_gateway_method.cors[0].http_method
  status_code = "200"
  response_models = {
    "application/json" = "Empty"
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = false,
    "method.response.header.Access-Control-Allow-Methods" = false,
    "method.response.header.Access-Control-Allow-Origin"  = false
  }
  depends_on = [aws_api_gateway_method.cors[0]]
}

resource "aws_api_gateway_integration" "cors" {
  count       = var.enable_cors ? 1 : 0
  rest_api_id = var.rest_api.id
  resource_id = var.resource.id
  http_method = aws_api_gateway_method.cors[0].http_method
  type        = "MOCK"

  request_templates = {
    "application/json" = <<EOF
{
   "statusCode": 200
}
EOF
  }
}

resource "aws_api_gateway_integration_response" "cors" {
  count       = var.enable_cors ? 1 : 0
  rest_api_id = var.rest_api.id
  resource_id = var.resource.id
  http_method = aws_api_gateway_method.cors[0].http_method
  status_code = aws_api_gateway_method_response.cors[0].status_code
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }
  depends_on = [aws_api_gateway_integration.cors[0]]
}
