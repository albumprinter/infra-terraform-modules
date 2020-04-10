# Module: CloudWatch Log Group

This module provisions a CloudWatch Log Group.

## Examples

#### Minimal configuration

```
module "log_group" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws_deprecated/cloudwatch_log_group"

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

#### Custom name

```
module "log_group" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws_deprecated/cloudwatch_log_group"

  name = "/aws/lambda/${var.function_name}"

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

## Required parameters

- **tags**: Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), tags are required and will be applied to all taggable resources.

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

- **cloudwatch_log_group**: contains all attributes available in Terraform for CloudWatch Log Group resources
