# Module: SNS Topic - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

#### Tags

* **tag_others**: map containing any extra tags that should be added to the resources except for the required tags.

------

#### SNS Topic

##### Optional
* [sns_topic_name](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#name)
* [sns_topic_name_prefix](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#name_prefix)
* [sns_topic_display_name](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#display_name)
* [sns_topic_policy](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#policy)
* [sns_topic_delivery_policy](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#delivery_policy)
* [sns_topic_application_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#application_success_feedback_role_arn)
* [sns_topic_application_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#application_success_feedback_sample_rate)
* [sns_topic_application_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#application_failure_feedback_role_arn)
* [sns_topic_http_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#http_success_feedback_role_arn)
* [sns_topic_http_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#http_success_feedback_sample_rate)
* [sns_topic_http_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#http_failure_feedback_role_arn)
* [sns_topic_kms_master_key_id](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#kms_master_key_id)
* [sns_topic_lambda_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#lambda_success_feedback_role_arn)
* [sns_topic_lambda_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#lambda_success_feedback_sample_rate)
* [sns_topic_lambda_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#lambda_failure_feedback_role_arn)
* [sns_topic_sqs_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#sqs_success_feedback_role_arn)
* [sns_topic_sqs_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#sqs_success_feedback_sample_rate)
* [sns_topic_sqs_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#sqs_failure_feedback_role_arn)

#### SNS Topic Subscription

This resource **will be created only if** `sns_topic_subscription_protocol` is configured. If so, there are required and optional parameters as described below.

##### Required
* [sns_topic_subscription_protocol](https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html#protocol)
* [sns_topic_subscription_endpoint](https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html#endpoint)

##### Optional
* [sns_topic_subscription_endpoint_auto_confirms](https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html#endpoint_auto_confirms)
* [sns_topic_subscription_confirmation_timeout_in_minutes](https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html#confirmation_timeout_in_minutes)
* [sns_topic_subscription_raw_message_delivery](https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html#raw_message_delivery)
* [sns_topic_subscription_filter_policy](https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html#filter_policy)
* [sns_topic_subscription_delivery_policy](https://www.terraform.io/docs/providers/aws/r/sns_topic_subscription.html#delivery_policy)