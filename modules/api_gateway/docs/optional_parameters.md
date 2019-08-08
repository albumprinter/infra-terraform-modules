# Module: API Gateway - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

They follow the same name as in the offical Terraform documentation with the addition of a prefix (e.g. *api_gateway_rest_api_*) to identify to which resource does the parameter belong to.

#### Tags

* **tag_others**: map containing any extra tags that should be added to the resources except for the required tags.
  * Note: The tag `name` shouldn't be used in this map, otherwise all resources will be tagged with the same value.

------

#### API Gateway REST API

* [api_gateway_rest_api_description](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#description)
* [api_gateway_rest_api_endpoint_configuration](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#endpoint_configuration)
  * Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    * [types](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#types)
  * Example:
```
api_gateway_rest_api_endpoint_configuration = [
  {
      types = ["..."]
    }
]
```
* [api_gateway_rest_api_binary_media_types](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#binary_media_types)
* [api_gateway_rest_api_minimum_compression_size](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#minimum_compression_size)
* [api_gateway_rest_api_body](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#body)
* [api_gateway_rest_api_policy](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#policy)
* [api_gateway_rest_api_api_key_source](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#api_key_source)

------

#### API Gateway Method

* [api_gateway_method_authorizer_id](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#authorizer_id)
* [api_gateway_method_authorization_scopes](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#authorization_scopes)
* [api_gateway_method_api_key_required](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#api_key_required)
* [api_gateway_method_request_models](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#request_models)
* [api_gateway_method_request_validator_id](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#request_validator_id)
* [api_gateway_method_request_parameters](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#request_parameters)

------

#### API Gateway Resource

* [api_gateway_resource_path_part](https://www.terraform.io/docs/providers/aws/r/api_gateway_resource.html#path_part)
  * Note: if not specified, all other resources will be linked to the path `/`
------

#### API Gateway Integration

* [api_gateway_integration_type](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#type)
* [api_gateway_integration_integration_http_method](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#integration_http_method)
* [api_gateway_integration_connection_type](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#connection_type)
* [api_gateway_integration_connection_id](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#connection_id)
* [api_gateway_integration_uri](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#uri)
* [api_gateway_integration_credentials](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#credentials)
* [api_gateway_integration_request_templates](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#request_templates)
* [api_gateway_integration_request_parameters](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#request_parameters)
* [api_gateway_integration_passthrough_behavior](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#passthrough_behavior)
* [api_gateway_integration_cache_key_parameters](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#cache_key_parameters)
* [api_gateway_integration_cache_namespace](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#cache_namespace)
* [api_gateway_integration_content_handling](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#content_handling)
* [api_gateway_integration_timeout_milliseconds](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#timeout_milliseconds)

------

#### API Gateway Deployment

* [api_gateway_deployment_stage_name](https://www.terraform.io/docs/providers/aws/r/api_gateway_deployment.html#stage_name)
* [api_gateway_deployment_description](https://www.terraform.io/docs/providers/aws/r/api_gateway_deployment.html#description)
* [api_gateway_deployment_stage_description](https://www.terraform.io/docs/providers/aws/r/api_gateway_deployment.html#stage_description)
* [api_gateway_deployment_variables](https://www.terraform.io/docs/providers/aws/r/api_gateway_deployment.html#variables)


#### API Gateway Method Response
* [api_gateway_method_response_http_method](https://www.terraform.io/docs/providers/aws/r/api_gateway_method_response.html#http_method)
* [api_gateway_method_response_status_code](https://www.terraform.io/docs/providers/aws/r/api_gateway_method_response.html#status_code)
* [api_gateway_method_response_response_models](https://www.terraform.io/docs/providers/aws/r/api_gateway_method_response.html#response_models)
* [api_gateway_method_response_response_parameters](https://www.terraform.io/docs/providers/aws/r/api_gateway_method_response.html#response_parameters)

#### API Gateway Integration Response
* [api_gateway_integration_response_http_method](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration_response.html#http_method)
* [api_gateway_integration_response_status_code](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration_response.html#status_code)
* [api_gateway_integration_response_selection_pattern](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration_response.html#selection_pattern)
* [api_gateway_integration_response_response_templates](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration_response.html#response_templates)
* [api_gateway_integration_response_response_parameters](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration_response.html#response_parameters)
* [api_gateway_integration_response_content_handling](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration_response.html#content_handling)


#### API Gateway API Key
* [api_gateway_api_key_name](https://www.terraform.io/docs/providers/aws/r/api_gateway_api_key.html#name)
* [api_gateway_api_key_description](https://www.terraform.io/docs/providers/aws/r/api_gateway_api_key.html#description)
* [api_gateway_api_key_enabled](https://www.terraform.io/docs/providers/aws/r/api_gateway_api_key.html#enabled)
* [api_gateway_api_key_value](https://www.terraform.io/docs/providers/aws/r/api_gateway_api_key.html#value)

#### API Gateway Usage Plan
* [api_gateway_usage_plan_name](https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html#name)
* [api_gateway_usage_plan_description](https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html#description)
* [api_gateway_usage_plan_product_code](https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html#product_code)
* [api_gateway_usage_plan_api_stages](https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html#api_stages)
  * Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    * [api_id](https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html#api_id)
    * [stage](https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html#stage)
  * Example:
```
event_target_batch_target = [
  {
    api_id = "..."
    stage = "..."
  }
]
```
* [api_gateway_usage_plan_quota_settings](https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html#quota_settings)
  * Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    * [limit](https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html#limit)
    * [offset](https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html#offset)
    * [period](https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html#period)
  * Example:
```
event_target_batch_target = [
  {
    limit = "..."
    offset = "..."
    period = "..."
  }
]
```
* [api_gateway_usage_plan_throttle_settings](https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html#throttle_settings)
  * Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    * [burst_limit](https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html#burst_limit)
    * [rate_limit](https://www.terraform.io/docs/providers/aws/r/api_gateway_usage_plan.html#rate_limit)
  * Example:
```
event_target_batch_target = [
  {
    burst_limit = "..."
    rate_limit = "..."
  }
]
```
