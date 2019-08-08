resource "aws_api_gateway_rest_api" "api" {
  count = var.provision == true ? 1 : 0
  
  # Required
  name = var.api_gateway_rest_api_name 

  # Optional
  description = var.api_gateway_rest_api_description 
  dynamic "endpoint_configuration" {
    for_each = [for configuration in var.api_gateway_rest_api_endpoint_configuration: {
      types = configuration.types
    }]

    content {
      types = endpoint_configuration.value.types     
    }
  }
  binary_media_types = var.api_gateway_rest_api_binary_media_types
  minimum_compression_size = var.api_gateway_rest_api_minimum_compression_size
  body = var.api_gateway_rest_api_body
  policy = var.api_gateway_rest_api_policy
  api_key_source = var.api_gateway_rest_api_api_key_source
}

resource "aws_api_gateway_resource" "resource" {
  count = var.provision == true && var.api_gateway_resource_path_part != null ? 1 : 0

  # Required
  rest_api_id = aws_api_gateway_rest_api.api[0].id
  parent_id   = aws_api_gateway_rest_api.api[0].root_resource_id
  path_part   = var.api_gateway_resource_path_part
}

resource "aws_api_gateway_method" "method" {
  count = var.provision == true && var.api_gateway_method_http_method != null ? 1 : 0
  
  # Required
  rest_api_id = aws_api_gateway_rest_api.api[0].id
  resource_id = var.api_gateway_resource_path_part != null ? aws_api_gateway_resource.resource[0].id : aws_api_gateway_rest_api.api[0].root_resource_id
  http_method = var.api_gateway_method_http_method
  authorization = var.api_gateway_method_authorization

  # Optional
  authorizer_id = var.api_gateway_method_authorizer_id
  authorization_scopes = var.api_gateway_method_authorization_scopes
  api_key_required = var.api_gateway_method_api_key_required
  request_models = var.api_gateway_method_request_models
  request_validator_id = var.api_gateway_method_request_validator_id
  request_parameters = var.api_gateway_method_request_parameters
}

resource "aws_api_gateway_method_response" "method_response" {
  count = var.provision == true && var.api_gateway_method_response_http_method != null ? 1 : 0

  # Required
  rest_api_id = aws_api_gateway_rest_api.api[0].id
  resource_id = var.api_gateway_resource_path_part != null ? aws_api_gateway_resource.resource[0].id : aws_api_gateway_rest_api.api[0].root_resource_id
  http_method = var.api_gateway_method_response_http_method
  status_code = var.api_gateway_method_response_status_code

  # Optional
  response_models = var.api_gateway_method_response_response_models
  response_parameters  = var.api_gateway_method_response_response_parameters
}

resource "aws_api_gateway_integration" "integration" {
  count = var.provision == true && var.api_gateway_integration_type != null ? 1 : 0
  
  # Required
  rest_api_id = aws_api_gateway_rest_api.api[0].id
  resource_id = var.api_gateway_resource_path_part != null ? aws_api_gateway_resource.resource[0].id : aws_api_gateway_rest_api.api[0].root_resource_id
  http_method = aws_api_gateway_method.method[0].http_method
  type = var.api_gateway_integration_type

  # Optional
  integration_http_method = var.api_gateway_integration_integration_http_method
  connection_type = var.api_gateway_integration_connection_type
  connection_id = var.api_gateway_integration_connection_id
  uri = var.api_gateway_integration_uri
  credentials = var.api_gateway_integration_credentials
  request_templates = var.api_gateway_integration_request_templates
  request_parameters = var.api_gateway_integration_request_parameters
  passthrough_behavior = var.api_gateway_integration_passthrough_behavior
  cache_key_parameters = var.api_gateway_integration_cache_key_parameters
  cache_namespace = var.api_gateway_integration_cache_namespace
  content_handling = var.api_gateway_integration_content_handling
  timeout_milliseconds = var.api_gateway_integration_timeout_milliseconds

  depends_on = [
    aws_api_gateway_method.method
  ]
}

resource "aws_api_gateway_integration_response" "integration_response" {
  count = var.provision == true && var.api_gateway_integration_response_http_method != null ? 1 : 0

  # Required
  rest_api_id = aws_api_gateway_rest_api.api[0].id
  resource_id = var.api_gateway_resource_path_part != null ? aws_api_gateway_resource.resource[0].id : aws_api_gateway_rest_api.api[0].root_resource_id
  http_method = var.api_gateway_integration_response_http_method
  status_code = var.api_gateway_integration_response_status_code

  # Optional
  selection_pattern = var.api_gateway_integration_response_selection_pattern
  response_templates = var.api_gateway_integration_response_response_templates
  response_parameters = var.api_gateway_integration_response_response_parameters
  content_handling = var.api_gateway_integration_response_content_handling
}

resource "aws_api_gateway_deployment" "deployment" {
  count = var.provision == true && var.api_gateway_integration_type != null ? 1 : 0
  
  # Required
  rest_api_id = aws_api_gateway_rest_api.api[0].id

  # Optional
  stage_name = var.api_gateway_deployment_stage_name != null ? var.api_gateway_deployment_stage_name : var.tag_environment
  description = var.api_gateway_deployment_description
  stage_description = var.api_gateway_deployment_stage_description
  variables = var.api_gateway_deployment_variables

  depends_on = [
    aws_api_gateway_integration.integration
  ]
}

resource "aws_api_gateway_api_key" "key" {
  count = var.provision == true && var.api_gateway_api_key_name != null ? 1 : 0

  # Required
  name = var.api_gateway_api_key_name 
  # Optional
  description = var.api_gateway_api_key_description
  enabled = var.api_gateway_api_key_enabled
  value = var.api_gateway_api_key_value
}

resource "aws_api_gateway_usage_plan" "plan" {
  count = var.provision == true && var.api_gateway_usage_plan_name != null ? 1 : 0

  # Required
  name = var.api_gateway_usage_plan_name

  # Optional
  description = var.api_gateway_usage_plan_description
  
  dynamic "api_stages" {
    for_each = var.api_gateway_usage_plan_api_stages

    content {
      api_id = api_stages.value.api_id
      stage = api_stages.value.stage     
    }
  }

  dynamic "quota_settings" {
    for_each = [for configuration in var.api_gateway_usage_plan_quota_settings: {
      limit = lookup(configuration, "limit", null)
      offset = lookup(configuration, "offset", null)
      period = lookup(configuration, "period", null)
    }]

    content {
      limit = quota_settings.value.limit
      offset = quota_settings.value.offset
      period = quota_settings.value.period
    }
  }

  dynamic "throttle_settings" {
    for_each = [for configuration in var.api_gateway_usage_plan_throttle_settings: {
      burst_limit = lookup(configuration, "burst_limit", null)
      rate_limit = lookup(configuration, "rate_limit", null)
    }]

    content {
      burst_limit = throttle_settings.value.burst_limit
      rate_limit = throttle_settings.value.rate_limit
    }
  }

  product_code = var.api_gateway_usage_plan_product_code
}

resource "aws_api_gateway_usage_plan_key" "key" {
  count = var.provision == true && var.api_gateway_api_key_name != null && var.api_gateway_usage_plan_name != null ? 1 : 0

  # Required
  key_id = aws_api_gateway_api_key.key[0].id
  key_type = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.plan[0].id
}
