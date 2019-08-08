# Module: SNS Topic - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

#### Tags

* **tag_others**: map containing any extra tags that should be added to the resources except for the required tags.

------

#### SNS Topic

* [name](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#name)
* [name_prefix](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#name_prefix)
* [display_name](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#display_name)
* [policy](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#policy)
* [delivery_policy](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#delivery_policy)
* [application_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#application_success_feedback_role_arn)
* [application_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#application_success_feedback_sample_rate)
* [application_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#application_failure_feedback_role_arn)
* [http_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#http_success_feedback_role_arn)
* [http_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#http_success_feedback_sample_rate)
* [http_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#http_failure_feedback_role_arn)
* [kms_master_key_id](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#kms_master_key_id)
* [lambda_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#lambda_success_feedback_role_arn)
* [lambda_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#lambda_success_feedback_sample_rate)
* [lambda_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#lambda_failure_feedback_role_arn)
* [sqs_success_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#sqs_success_feedback_role_arn)
* [sqs_success_feedback_sample_rate](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#sqs_success_feedback_sample_rate)
* [sqs_failure_feedback_role_arn](https://www.terraform.io/docs/providers/aws/r/sns_topic.html#sqs_failure_feedback_role_arn)