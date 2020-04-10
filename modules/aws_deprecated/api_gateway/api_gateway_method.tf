resource "aws_api_gateway_method" "method" {
  count = var.provision == true && var.api_gateway_method_http_method != null ? 1 : 0

  # Required  
  http_method   = var.api_gateway_method_http_method
  authorization = var.api_gateway_method_authorization

  # Internally handled
  rest_api_id = aws_api_gateway_rest_api.api[0].id
  resource_id = var.api_gateway_resource_path_part != null ? aws_api_gateway_resource.resource[0].id : aws_api_gateway_rest_api.api[0].root_resource_id

  # Optional
  authorizer_id        = var.api_gateway_method_authorizer_id
  authorization_scopes = var.api_gateway_method_authorization_scopes
  api_key_required     = var.api_gateway_method_api_key_required
  request_models       = var.api_gateway_method_request_models
  request_validator_id = var.api_gateway_method_request_validator_id
  request_parameters   = var.api_gateway_method_request_parameters
}

resource "aws_api_gateway_method_response" "method_response" {
  count = var.provision == true && var.api_gateway_method_response_http_method != null ? 1 : 0

  # Required
  http_method = var.api_gateway_method_response_http_method
  status_code = var.api_gateway_method_response_status_code

  # Internally handled
  rest_api_id = aws_api_gateway_rest_api.api[0].id
  resource_id = var.api_gateway_resource_path_part != null ? aws_api_gateway_resource.resource[0].id : aws_api_gateway_rest_api.api[0].root_resource_id

  # Optional
  response_models     = var.api_gateway_method_response_response_models
  response_parameters = var.api_gateway_method_response_response_parameters
}

# -------------------- Variables --------------------

variable "api_gateway_method_http_method" {
  default = null
}
variable "api_gateway_method_authorization" {
  default = null
}
variable "api_gateway_method_authorizer_id" {
  default = null
}
variable "api_gateway_method_authorization_scopes" {
  default = null
}
variable "api_gateway_method_api_key_required" {
  default = null
}
variable "api_gateway_method_request_models" {
  default = null
}
variable "api_gateway_method_request_validator_id" {
  default = null
}
variable "api_gateway_method_request_parameters" {
  default = null
}
variable "api_gateway_method_response_http_method" {
  default = null
}
variable "api_gateway_method_response_status_code" {
  default = null
}
variable "api_gateway_method_response_response_models" {
  default = null
}
variable "api_gateway_method_response_response_parameters" {
  default = null
}