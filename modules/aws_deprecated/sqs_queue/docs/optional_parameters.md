# Module: SQS Queue - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

#### SQS Queue

- [content_based_deduplication](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#content_based_deduplication)
- [delay_seconds](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#delay_seconds)
- [fifo_queue](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#fifo_queue)
- [kms_data_key_reuse_period_seconds](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#kms_data_key_reuse_period_seconds)
- [kms_master_key_id](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#kms_master_key_id)
- [message_retention_seconds](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#message_retention_seconds)
- [max_message_size](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#max_message_size)
- [name](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#name)
- [name_prefix](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#name_prefix)
- [policy](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#policy)
- [receive_wait_time_seconds](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#receive_wait_time_seconds)
- [redrive_policy](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#redrive_policy)
- [visibility_timeout_seconds](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html#visibility_timeout_seconds)

#### SQS Queue Policy

- policy_statements
  - Note: This attribute should be passed as an array containing policy statements:
  - Example:

```
policy_statements = [
  {
    "Effect": "Allow",
    "Action": ["sqs:SendMessage"],
    "Condition": {
      "ArnEquals": {
        "aws:SourceArn": "arn:aws:lambda:eu-west-1:055974010211:function:EXAMPLE"
      }
    }
  }
]
```
