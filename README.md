# Infra Terraform Modules

An **opinionated** set of **Terraform 0.12** compatible modules for standardized infrastructure provisioning.

## Repository Structure

The directories in this repository are organized in the following way:

* [**Examples**](examples): contains examples on how to use all available modules. These examples are also used to validate changes.
* [**Modules**](modules): contains all available modules and documentation on how to use each of them.

## Available Modules

### AWS

* [**API Gateway**](modules/aws/api_gateway)
* [**CloudWatch Log Group**](modules/aws/cloudwatch_log_group)
* [**CloudWatch Event Rule**](modules/aws/event_rule)
* [**CloudWatch Metric Alarm**](modules/aws/cloudwatch_metric_alarm)
* [**CodeBuild Project**](modules/aws/codebuild_project)
* [**Config Rule**](modules/aws/config_config_rule)
* [**ECR Repository**](modules/aws/ecr_repository)
* [**ECS Task Definition**](modules/aws/ecs_task)
* [**Glue Crawler**](modules/aws/glue_crawler)
* [**IAM Role**](modules/aws/iam_role)
* [**Lambda Function**](modules/aws/lambda_function)
* [**Route 53 Hosted Zone**](modules/aws/route53_hosted_zone)
* [**Security Group**](modules/aws/security_group)
* [**Step Function State Machine**](modules/aws/sfn_state_machine)
* [**SNS Topic**](modules/aws/sns_topic)
* [**SQS Queue**](modules/aws/sqs_queue)
