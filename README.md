# Infra Terraform Modules

An **opinionated** set of **Terraform 0.12** compatible modules for standardized infrastructure provisioning.

## Repository Structure

The directories in this repository are organized in the following way:

- [**Examples**](examples): contains examples on how to use all available modules. These examples are also used to validate changes.
- [**Modules**](modules): contains all available modules and documentation on how to use each of them.

## Available Modules

### AWS

- [**api_gateway_cors**](modules/aws/api_gateway_cors)
- [**api_gateway_custom_authorizer**](modules/aws/api_gateway_custom_authorizer)
- [**api_gateway_method_to_lambda**](modules/aws/api_gateway_method_to_lambda)
- [**api_gateway_rest_api**](modules/aws/api_gateway_rest_api)
- [**config_custom_rule**](modules/aws/config_custom_rule)
- [**ecr_repository**](modules/aws/ecr_repository)
- [**ecs_fargate_task**](modules/aws/ecs_fargate_task)
- [**iam_role_with_policy**](modules/aws/iam_role_with_policy)
- [**lambda_function**](modules/aws/lambda_function)
- [**lambda_function_event_rule**](modules/aws/lambda_function_event_rule)
- [**lambda_function_sns**](modules/aws/lambda_function_sns)
- [**lambda_function_sqs**](modules/aws/lambda_function_sqs)
- [**sfn_state_machine**](modules/aws/sfn_state_machine)

## Versions 0.2.x (deprecated)

From version `0.2.x` to `0.3.x`, the set of available modules was modified and breaking changes were introduced in the modules that remained.

For now, modules compatible with `0.2.x` versions were moved to [modules/aws_deprecated](modules/aws_deprecated) for bug fixes.

## How to test new Terraform release

For managing easily different Terraform releases, it's suggested to install the command [tfenv](https://github.com/tfutils/tfenv)

Based on the TF release to test, 1.5 in that case, in the repository create a directory 1.5 under `./example/aws`, as in the tree below.

In that directory copy the module to test and the files `example.tf` and `locals.tf` 

    /infra-terraform-modules
    ├── examples
    │   └── aws
    │       ├── 1.5
    │       │   ├── module_to_test
    │       │   │   ├── ...
    │       │   │   ├── ...
    │       │   ├── examples.tf
    │       │   ├── locals.tf

To properly call the source, update the `main.tf` file, inside the module under test, according to the new path. 

Update the above  `examples.tf` file with the proper `terraform release` and the `hashicorp/aws provider`:

```hcl
terraform {
  required_version = ">= 1.5.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# Providers
provider "aws" {
  region = "eu-west-1"
}
```

It's likely, during the test, to face some issues due to some resources already created.<br />
To avoid that you can try to update the `local.tf` file updating the `project_name` variable:


```hcl
   project_name = "InfraTerraformModules1_5"
```
