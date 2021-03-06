# Module: Lambda Function - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

They follow the same name as in the offical Terraform documentation with the addition of a prefix (e.g. _function\__) to identify to which resource does the parameter belong to.

#### Lambda Function

- **function_dead_letter_target_type**: this a custom string parameter that indicates which type of dead letter mechanism should be used. Valid values are `SNS` or `SQS`, being `SQS` the default one.
- **function_dead_letter_target_name**: this a custom string parameter that indicates the name for the dead letter mechanism (either a topic or a queue). If not passed, the default name will be either `"${var.function_name}_dead_letter_queue"` or `"${var.function_name}_dead_letter_topic"`
- [function_handler](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#handler)
- [function_filename](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#filename)
  - Note: If defined, The `function_s3_`-prefixed options cannot be used.
- [function_s3_bucket](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#s3_bucket)
  - Note: Conflicts with `function_filename`
- [function_s3_key](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#s3_key)
  - Note: Conflicts with `function_filename`
- [function_s3_object_version](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#s3_object_version)
  - Note: Conflicts with `function_filename`
- [function_environment](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#variables)
- [function_description](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#description)
- [function_kms_key_arn](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#kms_key_arn)
- [function_layers](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#layers)
- [function_memory_size](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#memory_size)
- [function_publish](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#publish)
- [function_reserved_concurrent_executions](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#reserved_concurrent_executions)
- [function_source_code_hash](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#source_code_hash)
- [function_timeout](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#timeout)
  - Note: by default, uses the value `60` if not specified
- [function_vpc_config](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#vpc_config)
  - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    - [subnet_ids](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#subnet_ids)
    - [security_group_ids](https://www.terraform.io/docs/providers/aws/r/lambda_function.html#security_group_ids)
    - Example:
  ```
  function_vpc_config = [
    {
      subnet_ids = "..."
      security_group_ids = "..."
    }
  ]
  ```

---

#### IAM Role

- **iam_role_policy_statements**: IAM policy statements granting permissions to the function.
  - Note: The [basic permissions](lambda_function.tf#L37) to write log messages, send dead letter information, and manage VPC interfaces (if applicable) will be granted automatically and don't need to be listed here.
- [iam_role_description](https://www.terraform.io/docs/providers/aws/r/iam_role.html#description)
- [iam_role_force_detach_policies](https://www.terraform.io/docs/providers/aws/r/iam_role.html#force_detach_policies)
- [iam_role_max_session_duration](https://www.terraform.io/docs/providers/aws/r/iam_role.html#max_session_duration)
- [iam_role_name](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name)
- [iam_role_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name_prefix)
- [iam_role_path](https://www.terraform.io/docs/providers/aws/r/iam_role.html#path)
- [iam_role_permissions_boundary](https://www.terraform.io/docs/providers/aws/r/iam_role.html#permissions_boundary)
- [iam_role_policy_description](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#description)
- [iam_role_policy_name](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name)
- [iam_role_policy_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name_prefix)
- [iam_role_policy_path](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#path)

---

#### CloudWatch Log Group

- [log_group_retention_in_days](https://www.terraform.io/docs/providers/aws/r/cloudwatch_log_group.html#retention_in_days)
  - Note: by default, uses the value `30` if not specified
- [log_group_kms_key_id](https://www.terraform.io/docs/providers/aws/r/cloudwatch_log_group.html#kms_key_id)

---

#### CloudWatch Error Alarm

- [cloudwatch_error_alarm_comparison_operator](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#comparison_operator)
  - Note: by default, uses the value `GreaterThanThreshold` if not specified
- [cloudwatch_error_alarm_evaluation_periods](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#evaluation_periods)
  - Note: by default, uses the value `1` if not specified
- [cloudwatch_error_alarm_threshold](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#threshold)
  - Note: by default, uses the value `0` if not specified
- [cloudwatch_error_alarm_period](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#period)
  - Note: by default, uses the value `60` if not specified
- [cloudwatch_error_alarm_statistic](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#statistic)
  - Note: by default, uses the value `Maximum` if not specified
- [cloudwatch_error_alarm_actions_enabled](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#actions_enabled)
- [cloudwatch_error_alarm_alarm_actions](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#alarm_actions)
- [cloudwatch_error_alarm_alarm_description](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#alarm_description)
- [cloudwatch_error_alarm_datapoints_to_alarm](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#datapoints_to_alarm)
- [cloudwatch_error_alarm_insufficient_data_actions](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#insufficient_data_actions)
- [cloudwatch_error_alarm_ok_actions](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#ok_actions)
- [cloudwatch_error_alarm_unit](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#unit)
- [cloudwatch_error_alarm_extended_statistic](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#extended_statistic)
- [cloudwatch_error_alarm_treat_missing_data](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#treat_missing_data)
- [cloudwatch_error_alarm_evaluate_low_sample_count_percentiles](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#evaluate_low_sample_count_percentiles)

---

#### Dead Letter SQS Queue

- [dead_letter_queue_content_based_deduplication](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#content_based_deduplication)
- [dead_letter_queue_delay_seconds](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#delay_seconds)
- [dead_letter_queue_fifo_queue](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#fifo_queue)
- [dead_letter_queue_kms_data_key_reuse_period_seconds](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#kms_data_key_reuse_period_seconds)
- [dead_letter_queue_kms_master_key_id](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#kms_master_key_id)
- [dead_letter_queue_message_retention_seconds](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#message_retention_seconds)
- [dead_letter_queue_max_message_size](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#max_message_size)
- [dead_letter_queue_receive_wait_time_seconds](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#receive_wait_time_seconds)
- [dead_letter_queue_redrive_policy](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#redrive_policy)
- [dead_letter_queue_visibility_timeout_seconds](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#visibility_timeout_seconds)

---

#### Dead Letter SNS Topic (Optional)

This resource **will be created only if** `function_dead_letter_target_type` is set to `SNS`. If so, the default resource _Dead Letter SQS Queue_ won't be created.

- [dead_letter_topic_policy](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#policy)
- [dead_letter_topic_delivery_policy](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#delivery_policy)
- [dead_letter_topic_application_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#application_success_feedback_role_arn)
- [dead_letter_topic_application_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#application_success_feedback_sample_rate)
- [dead_letter_topic_application_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#application_failure_feedback_role_arn)
- [dead_letter_topic_http_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#http_success_feedback_role_arn)
- [dead_letter_topic_http_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#http_success_feedback_sample_rate)
- [dead_letter_topic_http_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#http_failure_feedback_role_arn)
- [dead_letter_topic_kms_master_key_id](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#kms_master_key_id)
- [dead_letter_topic_lambda_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#lambda_success_feedback_role_arn)
- [dead_letter_topic_lambda_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#lambda_success_feedback_sample_rate)
- [dead_letter_topic_lambda_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#lambda_failure_feedback_role_arn)
- [dead_letter_topic_sqs_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#sqs_success_feedback_role_arn)
- [dead_letter_topic_sqs_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#sqs_success_feedback_sample_rate)
- [dead_letter_topic_sqs_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#sqs_failure_feedback_role_arn)
