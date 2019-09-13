# Module: Lambda Function

This module provisions a Lambda function along with the following resources:

* IAM Role with minimum permissions required
* CloudWatch Log Group with a default retention period of 30 days
* Dead letter mechanism that can be either a SQS Queue (default) or a SNS Topic

## Examples 

These are some examples of how this module can be used. For more, please check this [examples file](../../examples/lambda_function/main.tf).

#### Minimal configuration
```
module "lambda_function" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/lambda_function"

  function_name    = "example"
  function_runtime = var.function_runtime

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}
```

#### Custom deployment package
```
module "lambda_function" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/lambda_function"

  function_name    = "example"
  function_handler = var.function_handler
  function_runtime = var.function_runtime

  function_s3_bucket = var.function_s3_bucket
  function_s3_key    = var.function_s3_key

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}
```

#### Additional IAM permissions
```
module "lambda_function" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/lambda_function"

  function_name    = "example"
  function_handler = var.function_handler
  function_runtime = var.function_runtime

  function_s3_bucket = var.function_s3_bucket
  function_s3_key    = var.function_s3_key

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain

  iam_role_policy_statements = [
    {
      "Effect" : "Allow",
      "Action" : [
        "s3:ListBucket"
      ],
      "Resource" : ["*"]
    }
  ]
}
```

#### VPC access
```
module "lambda_function_vpc" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/lambda_function"

  function_name    = "infra_tf_modules_example_lambda_function_vpc"
  function_handler = var.function_handler
  function_runtime = var.function_runtime

  function_s3_bucket = var.function_s3_bucket
  function_s3_key    = var.function_s3_key

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain

  function_vpc_config_subnet_ids         = data.aws_subnet_ids.private.ids
  function_vpc_config_security_group_ids = [data.aws_security_group.default.id]
}
```

#### SNS Topic as Dead Letter mechanism
```
module "lambda_function_sns" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/lambda_function"

  function_name    = "infra_tf_modules_example_lambda_function_sns"
  function_handler = var.function_handler
  function_runtime = var.function_runtime

  function_s3_bucket = var.function_s3_bucket
  function_s3_key    = var.function_s3_key

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain

  function_dead_letter_target_type = "SNS"
}
```

## Required parameters

The following parameters are considered required.

* [function_name](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#function_name)
* [function_runtime](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#runtime)

#### Tags
Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

* **tag_environment**
* **tag_cost_center**
* **tag_domain**

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

------

## Supported Patterns 

This module also supports common patterns such as:

* CloudWatch Rule (scheduled or event pattern) + Lambda
* API Gateway + Lambda
* SNS Topic + Lambda

To make use of these patterns, just pass one of the required parameters below:

* **event_rule_schedule_expression**: for scheduled CloudWatch Rules
* **event_rule_event_pattern**: for pattern based CloudWatch Rules
* **api_gateway_rest_api_name**: for API Gateway integration
* **sns_trigger**: for SNS Topic

### Examples

#### Scheduled Event Rule
```
module "lambda_function_scheduled" {
  source = "../../modules/lambda_function"

  function_name    = "infra_tf_modules_example_lambda_function_scheduled"
  function_handler = var.function_handler
  function_runtime = var.function_runtime

  function_s3_bucket = var.function_s3_bucket
  function_s3_key    = var.function_s3_key

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain

  event_rule_schedule_expression = "cron(0 2 * * ? *)"
}
```


#### API Gateway Integration
```
module "lambda_function_api_gateway" {
  source = "../../modules/lambda_function"

  function_name    = "infra_tf_modules_example_lambda_function_api_gateway"
  function_handler = var.function_handler
  function_runtime = var.function_runtime

  function_s3_bucket = var.function_s3_bucket
  function_s3_key    = var.function_s3_key

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain

  api_gateway_rest_api_name = "lambda_function_api_gateway"
}
```

#### SNS Topic Trigger
```
module "lambda_function_sns_trigger" {
  source = "../../modules/lambda_function"

  function_name    = "infra_tf_modules_example_lambda_function_sns_trigger"
  function_handler = var.function_handler
  function_runtime = var.function_runtime

  function_s3_bucket = var.function_s3_bucket
  function_s3_key    = var.function_s3_key

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain

  sns_trigger = true
}
```

The patterns can be further customized by passing any of the parameters supported by Terraform.

For more details, please check the [patterns documentation](docs/patterns.md)

## Outputs

* **lambda_function**: contains all attributes available in Terraform for Lambda function resources
* **iam_role**: contains all attributes available in Terraform for IAM Role resources
* **cloudwatch_log_group**: contains all attributes available in Terraform for CloudWatch Log Group resources
* **dead_letter_topic**: contains all attributes available in Terraform for SQS Queue resources (in case `function_dead_letter_target_type` equals `SQS`)
* **dead_letter_queue**: contains all attributes available in Terraform for SNS Topic resources (in case `function_dead_letter_target_type` equals `SNS`)
* **cloudwatch_event_rule**: contains all attributes available in Terraform for CloudWatch Event Rule resources
* **api_gateway_rest_api**: contains all attributes available in Terraform for API Gateway REST API resources
* **api_gateway_resource**: contains all attributes available in Terraform for API Gateway Resource resources
* **api_gateway_method**: contains all attributes available in Terraform for API Gateway Method resources
* **api_gateway_method_response**: contains all attributes available in Terraform for API Gateway Method Response resources
* **api_gateway_integration**: contains all attributes available in Terraform for API Gateway Integration resources
* **api_gateway_integration_response**: contains all attributes available in Terraform for API Gateway Integration Response resources
* **api_gateway_deployment**: contains all attributes available in Terraform for API Gateway Deployment resources
* **sns_trigger_topic**: contains all attributes available in Terraform for SNS Topic resources
* **sns_trigger_topic_subscription**: contains all attributes available in Terraform for SNS Topic Subscription resources
