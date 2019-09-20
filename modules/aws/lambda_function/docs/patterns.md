# Module: Lambda Function - Patterns

This module supports two patterns:

* CloudWatch Rule (scheduled or event pattern) + Lambda
* API Gateway + Lambda
* SNS Topic + Lambda
This page contains all the required and optional parameters that can be used to customized your deployment. 

## CloudWatch Event Rule + Lambda

#### CloudWatch Event Rule

This resource **will be created only if** either `event_rule_event_pattern` or `event_rule_schedule_expression` is configured. If so, there are required and optional parameters as described below.

##### Required
* [event_rule_event_pattern](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#event_pattern)
  * Note: Required, if `event_rule_schedule_expression` isn't specified
* [event_rule_schedule_expression](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#schedule_expression)
  * Note: Required, if `event_rule_event_pattern` isn't specified

##### Optional

* [event_rule_description](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#description)
* [event_rule_name](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#name)
* [event_rule_name_prefix](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#name_prefix)
* [event_rule_role_arn](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#role_arn)
* [event_rule_is_enabled](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#is_enabled)

------

#### CloudWatch Event Target

This resource **will be created only if** a `CloudWatch Event Rule` is configured.

* [event_target_target_id](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#target_id)
* [event_target_input](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#input)
* [event_target_input_path](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#input_path)
* [event_target_role_arn](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#role_arn)
* [event_target_input_transformer_input_paths](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#input_paths)
* [event_target_input_transformer_input_template](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#input_template)

------

#### Lambda Permission
* [event_rule_lambda_permission_action](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#action)
  * Note: by default, uses the value `lambda:InvokeFunction` if not specified
* [event_rule_lambda_permission_event_source_token](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#event_source_token)
* [event_rule_lambda_permission_qualifier](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#qualifier)
* [event_rule_lambda_permission_source_account](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#source_account)
* [event_rule_lambda_permission_statement_id](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#statement_id)
* [event_rule_lambda_permission_statement_id_prefix](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#statement_id_prefix)

------

## API Gateway REST API + Lambda

#### API Gateway REST API

This resource **will be created only if** `api_gateway_rest_api_name` is configured. If so, there are required and optional parameters as described below.

##### Required
* [api_gateway_rest_api_name](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#name)

##### Optional

* [api_gateway_rest_api_description](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#description)
* [api_gateway_rest_api_endpoint_configuration](https://www.terraform.io/docs/providers/aws/r/api_gateway_rest_api.html#types)
  * Note: by default, uses the value `EDGE` if not specified
  * Note [2]: This attribute should be passed as an array containing one or more objects with the following parameters:
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

#### API Gateway REST Resource

This resource **will be created only if** a `API Gateway REST API` is configured and `api_gateway_resource_path_part` is set. Otherwise, the default resource from the API Gateway REST API will be used to create any related resources.

* [api_gateway_resource_path_part](https://www.terraform.io/docs/providers/aws/r/api_gateway_resource.html#path_part)

------

#### API Gateway REST Method

This resource **will be created only if** `api_gateway_rest_api_name` is configured. If so, there are required and optional parameters as described below.

##### Required
* [api_gateway_method_http_method](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#http_method)
  * Note: by default, uses the value `ANY` if not specified
* [api_gateway_method_authorization](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#authorization)
  * Note: by default, uses the value `NONE` if not specified

##### Optional
* [api_gateway_method_authorizer_id](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#authorizer_id)
* [api_gateway_method_authorization_scopes](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#authorization_scopes)
* [api_gateway_method_api_key_required](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#api_key_required)
* [api_gateway_method_request_models](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#request_models)
* [api_gateway_method_request_validator_id](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#request_validator_id)
* [api_gateway_method_request_parameters](https://www.terraform.io/docs/providers/aws/r/api_gateway_method.html#request_parameters)

------

#### API Gateway Integration

This resource **will be created only if** `api_gateway_rest_api_name` is configured. If so, there are required and optional parameters as described below.

##### Required
* [api_gateway_integration_http_method](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#http_method)
  * Note: by default, uses the value `ANY` if not specified
* [api_gateway_integration_type](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#type)
  * Note: by default, uses the value `AWS_PROXY` if not specified

##### Optional
* [api_gateway_integration_integration_http_method](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#integration_http_method)
  * Note: by default, uses the value `POST` if not specified
* [api_gateway_integration_connection_type](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#connection_type)
* [api_gateway_integration_connection_id](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#connection_id)
* [api_gateway_integration_uri](https://www.terraform.io/docs/providers/aws/r/api_gateway_integration.html#uri)
  * Note: by default, uses the value `arn:aws:apigateway:{REGION}:lambda:path/2015-03-31/functions/{LAMBDA_FUNCTION_ARN}/invocations` if not specified
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

This resource **will be created only if** `api_gateway_rest_api_name` is configured.

* [api_gateway_deployment_stage_name](https://www.terraform.io/docs/providers/aws/r/api_gateway_deployment.html#stage_name)
  * Note: by default, uses the value provided for the variable `tag_environment` if not specified
* [api_gateway_deployment_description](https://www.terraform.io/docs/providers/aws/r/api_gateway_deployment.html#description)
* [api_gateway_deployment_stage_description](https://www.terraform.io/docs/providers/aws/r/api_gateway_deployment.html#stage_description)
* [api_gateway_deployment_variables](https://www.terraform.io/docs/providers/aws/r/api_gateway_deployment.html#variables)

------

#### Lambda Permission

* [api_gateway_lambda_permission_action](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#action)
  * Note: by default, uses the value `lambda:InvokeFunction` if not specified
* [api_gateway_lambda_permission_event_source_token](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#event_source_token)
* [api_gateway_lambda_permission_qualifier](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#qualifier)
* [api_gateway_lambda_permission_source_account](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#source_account)
* [api_gateway_lambda_permission_statement_id](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#statement_id)
* [api_gateway_lambda_permission_statement_id_prefix](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#statement_id_prefix)

------

## SNS Topic + Lambda

#### SNS Topic

This resource **will be created only if** `sns_trigger` is configured. If so, there are required and optional parameters as described below.

##### Optional

* [sns_trigger_name](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#name)
* [sns_trigger_name_prefix](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#name_prefix)
* [sns_trigger_display_name](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#display_name)
* [sns_trigger_policy](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#policy)
* [sns_trigger_delivery_policy](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#delivery_policy)
* [sns_trigger_application_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#application_success_feedback_role_arn)
* [sns_trigger_application_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#application_success_feedback_sample_rate)
* [sns_trigger_application_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#application_failure_feedback_role_arn)
* [sns_trigger_http_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#http_success_feedback_role_arn)
* [sns_trigger_http_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#http_success_feedback_sample_rate)
* [sns_trigger_http_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#http_failure_feedback_role_arn)
* [sns_trigger_kms_master_key_id](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#kms_master_key_id)
* [sns_trigger_lambda_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#lambda_success_feedback_role_arn)
* [sns_trigger_lambda_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#lambda_success_feedback_sample_rate)
* [sns_trigger_lambda_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#lambda_failure_feedback_role_arn)
* [sns_trigger_sqs_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#sqs_success_feedback_role_arn)
* [sns_trigger_sqs_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#sqs_success_feedback_sample_rate)
* [sns_trigger_sqs_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#sqs_failure_feedback_role_arn)

------

#### SNS Topic Subscription

This resource **will be created only if** `sns_trigger` is configured. If so, there are required and optional parameters as described below.

* [sns_trigger_subscription_endpoint_auto_confirms](https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html#endpoint_auto_confirms)
* [sns_trigger_subscription_confirmation_timeout_in_minutes](https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html#confirmation_timeout_in_minutes)
* [sns_trigger_subscription_raw_message_delivery](https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html#raw_message_delivery)
* [sns_trigger_subscription_filter_policy](https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html#filter_policy)
* [sns_trigger_subscription_delivery_policy](https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html#delivery_policy)

------

#### Lambda Permission

* [sns_trigger_lambda_permission_action](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#action)
  * Note: by default, uses the value `lambda:InvokeFunction` if not specified
* [sns_trigger_lambda_permission_event_source_token](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#event_source_token)
* [sns_trigger_lambda_permission_qualifier](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#qualifier)
* [sns_trigger_lambda_permission_source_account](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#source_account)
* [sns_trigger_lambda_permission_statement_id](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#statement_id)
* [sns_trigger_lambda_permission_statement_id_prefix](https://www.terraform.io/docs/providers/aws/r/lambda_permission.html#statement_id_prefix)