# Module: CloudWatch Log Group

This module provisions a CloudWatch Log Group.

## Examples 

#### Minimal configuration
```
module "log_group" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/cloudwatch_log_group"

  tag_domain = var.tag_domain
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
}
```

#### Custom name
```
module "log_group" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/cloudwatch_log_group"

  name = "/aws/lambda/${var.function_name}"

  tag_domain = var.tag_domain
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
}
```

## Required parameters

#### Tags
Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

* **tag_environment**
* **tag_cost_center**
* **tag_domain**

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

* **cloudwatch_log_group**: contains all attributes available in Terraform for CloudWatch Log Group resources
