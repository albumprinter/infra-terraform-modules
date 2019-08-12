# Module: SNS Topic

This module provisions a SNS Topic.

## Examples 

#### Minimal configuration
```
module "sns_topic" {
  source  = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/sns_topic"

  tag_domain = var.tag_domain
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
}
```

#### Including a custom topic name
```
module "sns_topic" {
  source  = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/sns_topic"

  name = "my_topic"

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

* **topic**: contains all attributes available in Terraform for SNS Topic resources