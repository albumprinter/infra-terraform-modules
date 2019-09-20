# Module: Config Rule

This module provisions a Config Rule with an optional Lambda function in case of a custom rule.

## Examples 

#### Minimal configuration
```
module "config_config_rule" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/config_config_rule"  

  config_rule_name              = "my-rule"
  config_rule_owner             = "AWS"
  config_rule_source_identifier = "S3_BUCKET_VERSIONING_ENABLED"

  tag_domain      = var.tag_domain
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
}
```

## Required parameters

The following parameters are considered required.

* [config_rule_name](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#name)
* [config_rule_owner](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#owner)
* [config_rule_source_identifier](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#source_identifier)

#### Tags
Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

* **tag_environment**
* **tag_cost_center**
* **tag_domain**

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Supported Patterns 

This module also supports custom rules. In this case, a Lambda function will also be provisioned.

To make use of this pattern, just pass the value `"CUSTOM_LAMBDA"` to the parameter `config_rule_owner`. By doing so, a Lambda function will be created with the same name as your Config Rule.

### Examples

```
module "config_config_rule" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/config_config_rule"  

  config_rule_name              = "my-custom-rule"
  config_rule_owner             = "CUSTOM_LAMBDA"

  tag_domain      = var.tag_domain
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
}
```

The pattern can be further customized by passing any of the parameters supported by Terraform.

For more details, please check the [patterns documentation](docs/patterns.md)

## Outputs

* **config_config_rule**: contains all attributes available in Terraform for Config Rule resources
* **custom_rule_lambda_function**: contains all attributes available in Terraform for Lambda Function resources (available when using custom rule)
* **custom_rule_iam_role**: contains all attributes available in Terraform for IAM Role resources (available when using custom rule)