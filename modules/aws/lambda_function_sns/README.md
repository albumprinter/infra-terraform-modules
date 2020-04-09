## Module Resources

This Terraform module provisions:

- SNS Topic
- SNS Topic Subscription
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

## Usage

```hcl
module "lambda_function_sns" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/lambda_function_sns?ref="

  name       = "${var.project_name}Lambda"
  source_dir = "${path.module}/src"

  tags = var.tags
}
```

# Outputs

- `archive_file`
- `aws_lambda_function`
- `aws_cloudwatch_log_group`
- `aws_iam_role`
- `aws_iam_policy`
- `aws_sns_topic`
- `aws_sns_topic_subscription`
- `aws_lambda_permission`