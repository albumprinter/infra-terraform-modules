# Module: IAM Role

This module provisions an IAM Role along with an optional IAM policy.

## Examples 

These are some examples of how this module can be used. For more, please check this [examples file](../../examples/ecs_task/main.tf).

#### Minimal configuration
```
module "role" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/iam_role"

  assume_role_principal = "lambda.amazonaws.com"  
  
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain
}
```

#### With optional IAM policy
```
module "role" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/iam_role"

  assume_role_principal = "lambda.amazonaws.com"
  policy_statements = [
    {
      "Effect" : "Allow",
      "Action" : [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource" : ["arn:aws:logs:*:*:*"]
    }
  ]
  
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain
}
```

## Required parameters

The following parameters are considered required.

* assume_role_principal: specifies who is authorized to assume the role (e.g. lambda.amazonaws.com, events.amazonaws.com, etc)

#### Tags
Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

* **tag_environment**
* **tag_cost_center**
* **tag_domain**

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

* **iam_role**: contains all attributes available in Terraform for IAM Role resources
* **iam_policy**: contains all attributes available in Terraform for IAM Policy resources
