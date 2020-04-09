resource "aws_api_gateway_integration" "integration" {
  count = var.provision == true && var.api_gateway_integration_type != null ? 1 : 0

  # Required  
  type = var.api_gateway_integration_type

  # Internally handled
  rest_api_id = aws_api_gateway_rest_api.api[0].id
  resource_id = var.api_gateway_resource_path_part != null ? aws_api_gateway_resource.resource[0].id : aws_api_gateway_rest_api.api[0].root_resource_id
  http_method = aws_api_gateway_method.method[0].http_method

  # Optional
  integration_http_method = var.api_gateway_integration_integration_http_method
  connection_type         = var.api_gateway_integration_connection_type
  connection_id           = var.api_gateway_integration_connection_id
  uri                     = var.api_gateway_integration_uri
  credentials             = var.api_gateway_integration_credentials
  request_templates       = var.api_gateway_integration_request_templates
  request_parameters      = var.api_gateway_integration_request_parameters
  passthrough_behavior    = var.api_gateway_integration_passthrough_behavior
  cache_key_parameters    = var.api_gateway_integration_cache_key_parameters
  cache_namespace         = var.api_gateway_integration_cache_namespace
  content_handling        = var.api_gateway_integration_content_handling
  timeout_milliseconds    = var.api_gateway_integration_timeout_milliseconds

  depends_on = [
    aws_api_gateway_method.method
  ]
}

resource "aws_api_gateway_integration_response" "integration_response" {
  count = var.provision == true && var.api_gateway_integration_response_http_method != null ? 1 : 0

  # Required
  http_method = var.api_gateway_integration_response_http_method
  status_code = var.api_gateway_integration_response_status_code

  # Internally handled
  rest_api_id = aws_api_gateway_rest_api.api[0].id
  resource_id = var.api_gateway_resource_path_part != null ? aws_api_gateway_resource.resource[0].id : aws_api_gateway_rest_api.api[0].root_resource_id

  # Optional
  selection_pattern   = var.api_gateway_integration_response_selection_pattern
  response_templates  = var.api_gateway_integration_response_response_templates
  response_parameters = var.api_gateway_integration_response_response_parameters
  content_handling    = var.api_gateway_integration_response_content_handling
}

# -------------------- Variables --------------------

variable "api_gateway_integration_http_method" {
  default = null
}
variable "api_gateway_integration_type" {
  default = null
}
variable "api_gateway_integration_integration_http_method" {
  default = null
}
variable "api_gateway_integration_connection_type" {
  default = null
}
variable "api_gateway_integration_connection_id" {
  default = null
}
variable "api_gateway_integration_uri" {
  default = null
}
variable "api_gateway_integration_credentials" {
  default = null
}
variable "api_gateway_integration_request_templates" {
  default = null
}
variable "api_gateway_integration_request_parameters" {
  default = null
}
variable "api_gateway_integration_passthrough_behavior" {
  default = null
}
variable "api_gateway_integration_cache_key_parameters" {
  default = null
}
variable "api_gateway_integration_cache_namespace" {
  default = null
}
variable "api_gateway_integration_content_handling" {
  default = null
}
variable "api_gateway_integration_timeout_milliseconds" {
  default = null
}
variable "api_gateway_integration_response_http_method" {
  default = null
}
variable "api_gateway_integration_response_status_code" {
  default = null
}
variable "api_gateway_integration_response_selection_pattern" {
  default = null
}
variable "api_gateway_integration_response_response_templates" {
  default = null
}
variable "api_gateway_integration_response_response_parameters" {
  default = null
}
variable "api_gateway_integration_response_content_handling" {
  default = null
}