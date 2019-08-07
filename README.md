# Infra Terraform Modules

A set of **Terraform 0.12** compatible modules for standardized infrastructure provisioning.

## Repository Structure

The directories in this repository are organized in the following way:

* [**Examples**](examples): contains examples on how to use all available modules. These examples are also used to validate changes.
* [**Modules**](modules): contains all available modules and documentation on how to use each of them.
* [**Resources**](resources): contains the definition of all individual resources used by the modules.

## Available Modules

* [**API Gateway**](modules/api_gateway)
* [**ECS Task Definition**](modules/ecs_task)
* [**CloudWatch Event Rule**](modules/event_rule)
* [**Lambda Function**](modules/lambda_function)
* [**Route 53 Zone**](modules/route53_zone)
