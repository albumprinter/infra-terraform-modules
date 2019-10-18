module "api_gateway" {
  source    = "../api_gateway"
  provision = var.api_gateway_rest_api_name != null ? true : false

  # Required
  api_gateway_rest_api_name         = var.api_gateway_rest_api_name
  api_gateway_deployment_stage_name = var.api_gateway_deployment_stage_name

  # Internally handled
  api_gateway_integration_uri = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${aws_lambda_function.function[0].arn}/invocations"

  # Optional
  api_gateway_rest_api_description              = var.api_gateway_rest_api_description
  api_gateway_rest_api_endpoint_configuration   = var.api_gateway_rest_api_endpoint_configuration
  api_gateway_rest_api_binary_media_types       = var.api_gateway_rest_api_binary_media_types
  api_gateway_rest_api_minimum_compression_size = var.api_gateway_rest_api_minimum_compression_size
  api_gateway_rest_api_body                     = var.api_gateway_rest_api_body
  api_gateway_rest_api_policy                   = var.api_gateway_rest_api_policy
  api_gateway_rest_api_api_key_source           = var.api_gateway_rest_api_api_key_source

  api_gateway_resource_path_part = var.api_gateway_resource_path_part

  api_gateway_method_http_method          = var.api_gateway_method_http_method
  api_gateway_method_authorization        = var.api_gateway_method_authorization
  api_gateway_method_authorizer_id        = var.api_gateway_method_authorizer_id
  api_gateway_method_authorization_scopes = var.api_gateway_method_authorization_scopes
  api_gateway_method_api_key_required     = var.api_gateway_method_api_key_required
  api_gateway_method_request_models       = var.api_gateway_method_request_models
  api_gateway_method_request_validator_id = var.api_gateway_method_request_validator_id
  api_gateway_method_request_parameters   = var.api_gateway_method_request_parameters

  api_gateway_integration_type                    = var.api_gateway_integration_type
  api_gateway_integration_integration_http_method = var.api_gateway_integration_integration_http_method
  api_gateway_integration_connection_type         = var.api_gateway_integration_connection_type
  api_gateway_integration_connection_id           = var.api_gateway_integration_connection_id
  api_gateway_integration_credentials             = var.api_gateway_integration_credentials
  api_gateway_integration_request_templates       = var.api_gateway_integration_request_templates
  api_gateway_integration_request_parameters      = var.api_gateway_integration_request_parameters
  api_gateway_integration_passthrough_behavior    = var.api_gateway_integration_passthrough_behavior
  api_gateway_integration_cache_key_parameters    = var.api_gateway_integration_cache_key_parameters
  api_gateway_integration_cache_namespace         = var.api_gateway_integration_cache_namespace
  api_gateway_integration_content_handling        = var.api_gateway_integration_content_handling
  api_gateway_integration_timeout_milliseconds    = var.api_gateway_integration_timeout_milliseconds

  api_gateway_deployment_description       = var.api_gateway_deployment_description
  api_gateway_deployment_stage_description = var.api_gateway_deployment_stage_description
  api_gateway_deployment_variables         = var.api_gateway_deployment_variables
}

resource "aws_lambda_permission" "api_gateway_lambda_permission" {
  count = var.api_gateway_rest_api_name != null ? 1 : 0

  # Internally handled
  action        = var.api_gateway_lambda_permission_action
  function_name = aws_lambda_function.function[0].function_name
  principal     = "apigateway.amazonaws.com"

  # Optional
  event_source_token  = var.api_gateway_lambda_permission_event_source_token
  qualifier           = var.api_gateway_lambda_permission_qualifier
  source_account      = var.api_gateway_lambda_permission_source_account
  statement_id        = var.api_gateway_lambda_permission_statement_id
  statement_id_prefix = var.api_gateway_lambda_permission_statement_id_prefix
  source_arn          = "${module.api_gateway.api_gateway_rest_api.execution_arn}/*/*/*"
}

# ----------------------- Variables -----------------------

variable "api_gateway_rest_api_name" {
  default = null
}
variable "api_gateway_rest_api_description" {
  default = null
}
variable "api_gateway_rest_api_endpoint_configuration" {
  default = [
    {
      types = ["EDGE"]
    }
  ]
}
variable "api_gateway_rest_api_binary_media_types" {
  default = null
}
variable "api_gateway_rest_api_minimum_compression_size" {
  default = null
}
variable "api_gateway_rest_api_body" {
  default = null
}
variable "api_gateway_rest_api_policy" {
  default = null
}
variable "api_gateway_rest_api_api_key_source" {
  default = null
}
variable "api_gateway_resource_path_part" {
  default = null
}
variable "api_gateway_method_http_method" {
  default = "ANY"
}
variable "api_gateway_method_authorization" {
  default = "NONE"
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
variable "api_gateway_integration_http_method" {
  default = "ANY"
}
variable "api_gateway_integration_type" {
  default = "AWS_PROXY"
}
variable "api_gateway_integration_integration_http_method" {
  default = "POST"
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
variable "api_gateway_deployment_stage_name" {
  default = null
}
variable "api_gateway_deployment_description" {
  default = ""
}
variable "api_gateway_deployment_stage_description" {
  default = null
}
variable "api_gateway_deployment_variables" {
  default = null
}
variable "api_gateway_lambda_permission_action" {
  default = "lambda:InvokeFunction"
}
variable "api_gateway_lambda_permission_event_source_token" {
  default = null
}
variable "api_gateway_lambda_permission_qualifier" {
  default = null
}
variable "api_gateway_lambda_permission_source_account" {
  default = null
}
variable "api_gateway_lambda_permission_statement_id" {
  default = null
}
variable "api_gateway_lambda_permission_statement_id_prefix" {
  default = null
}