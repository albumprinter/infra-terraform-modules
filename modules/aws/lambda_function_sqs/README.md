## Module Resources

This Terraform module provisions:

- SQS Queue
- Lambda Event Source Mapping
- Lambda function
- CloudWatch Log Group
- IAM Role
- IAM Policy

## Module Input Variables

- `name` - Name that should be used for the Lambda function and related resources
- `source_dir` - Local directory containing the source code for the Lambda Function
- `handler` - The entrypoint that should be called when the Lambda function is invoked
- `runtime` - Runtime that should be used for the Lambda function
- `layers` - List of Lambda layers that should be attached to the Lambda function
- `memory_size` - Amount of memory that should be configured for the Lambda function
- `timeout` - Timeout for the Lambda function
- `environment` - Environment configuration for the Lambda function
- `vpc_config` - VPC Config for the Lambda function
- `tags` - Tags that should be applied to all resources in this module
- `retention_in_days` - Retention period for log messages in days
- `policy_statements` - IAM Policy Statements that should be applied to the Lambda function
- `delay_seconds` - The time in seconds that the delivery of all messages in the queue will be delayed
- `batch_size` - The largest number of records that Lambda will retrieve from the queue at the time of invocation
- `sqs_queue_policy` - Policy that should be applied to the SQS queue

## Usage

```hcl
module "lambda_function_sqs" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/lambda_function_sqs?ref="

  name       = "${var.project_name}Lambda"
  source_dir = "${path.module}/src"

  tags = var.tags
}
```

```hcl
module "lambda_function_sqs" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/lambda_function_sqs?ref="

  name       = "${var.project_name}Lambda"
  source_dir = "${path.module}/src"
  sqs_queue_policy = templatefile("${path.module}/templates/queue_policy.json", {
    bucket_arn = aws_s3_bucket.this.arn
  })

  tags = var.tags
}
```

# Outputs

- `archive_file`
- `aws_lambda_function`
- `aws_cloudwatch_log_group`
- `aws_iam_role`
- `aws_iam_policy`
- `aws_sqs_queue`
- `aws_lambda_event_source_mapping`