# Infra Terraform Modules

A set of **Terraform 0.12** compatible modules for standardized infrastructure provisioning.

## Repository Structure

The directories in this repository are organized in the following way:

* [**Examples**](examples): contains examples on how to use all available modules. These examples are also used to validate changes.
* [**Modules**](modules): contains all available modules and documentation on how to use each of them.

## Available Modules

* [**API Gateway**](modules/api_gateway)
* [**CloudWatch Log Group**](modules/cloudwatch_log_group)
* [**CloudWatch Event Rule**](modules/event_rule)
* [**ECS Task Definition**](modules/ecs_task)
* [**IAM Role**](modules/iam_role)
* [**Lambda Function**](modules/lambda_function)
* [**Route 53 Hosted Zone**](modules/route53_hosted_zone)
* [**Security Group**](modules/security_group)
* [**SNS Topic**](modules/sns_topic)
* [**SQS Queue**](modules/sqs_queue)
