# Module: Config Rule - Patterns

This module supports supports custom rules.

This page contains all the required and optional parameters that can be used to customized your deployment. 

## Built-In Lambda Function

#### Lambda Function

This resource **will be created only if** either `config_rule_owner` equals `"CUSTOM_LAMBDA"`. If so, there are optional parameters that can be used as described below.

##### Optional

* [custom_rule_function_name](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#function_name)
  * Note: If not defined, the value passed for `config_rule_name` will be used.
* [custom_rule_function_runtime](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#runtime)
  * Note: If not defined, the value `python3.7` will be used.
* **function_dead_letter_target_type**: this a custom string parameter that indicates which type of dead letter mechanism should be used. Valid values are `SNS` or `SQS`, being `SQS` the default one.
* **function_dead_letter_target_name**: this a custom string parameter that indicates the name for the dead letter mechanism (either a topic or a queue). If not passed, the default name will be either `"${var.function_name}_dead_letter_queue"` or `"${var.function_name}_dead_letter_topic"`
* [custom_rule_function_handler](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#handler)
* [custom_rule_function_filename](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#filename)
  * Note: If defined, The `function_s3_`-prefixed options cannot be used.
* [custom_rule_function_s3_bucket](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#s3_bucket)
  * Note: Conflicts with `function_filename`
* [custom_rule_function_s3_key](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#s3_key)
  * Note: Conflicts with `function_filename`
* [custom_rule_function_s3_object_version](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#s3_object_version)
  * Note: Conflicts with `function_filename`
* [custom_rule_function_environment](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#variables)
* [custom_rule_function_description](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#description)
* [custom_rule_function_kms_key_arn](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#kms_key_arn)
* [custom_rule_function_layers](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#layers)
* [custom_rule_function_memory_size](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#memory_size)
* [custom_rule_function_publish](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#publish)
* [custom_rule_function_reserved_concurrent_executions](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#reserved_concurrent_executions)
* [custom_rule_function_source_code_hash](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#source_code_hash)
* [custom_rule_function_timeout](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#timeout)
* [custom_rule_function_vpc_config](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#vpc_config)
  * Note: This attribute should be passed as an array containing one or more objects with the following parameters:
      * [subnet_ids](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#subnet_ids)
      * [security_group_ids](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#security_group_ids)
    * Example:
  ```
  function_vpc_config = [
    {
      subnet_ids = "..."
      security_group_ids = "..."
    }
  ]
  ```
------

#### IAM Role

##### Optional

* **custom_rule_iam_role_policy_statements**: IAM policy statements granting permissions to the function.
  * Note: The [basic permissions](lambda_function.tf#L37) to write log messages, send dead letter information, and manage VPC interfaces (if applicable) will be granted automatically and don't need to be listed here. 
* [custom_rule_iam_role_description](https://www.terraform.io/docs/providers/aws/r/iam_role.html#description)
* [custom_rule_iam_role_force_detach_policies](https://www.terraform.io/docs/providers/aws/r/iam_role.html#force_detach_policies)
* [custom_rule_iam_role_max_session_duration](https://www.terraform.io/docs/providers/aws/r/iam_role.html#max_session_duration)
* [custom_rule_iam_role_name](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name)
* [custom_rule_iam_role_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name_prefix)
* [custom_rule_iam_role_path](https://www.terraform.io/docs/providers/aws/r/iam_role.html#path)
* [custom_rule_iam_role_permissions_boundary](https://www.terraform.io/docs/providers/aws/r/iam_role.html#permissions_boundary)
* [custom_rule_iam_role_policy_description](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#description)
* [custom_rule_iam_role_policy_name](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name)
* [custom_rule_iam_role_policy_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name_prefix)
* [custom_rule_iam_role_policy_path](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#path)