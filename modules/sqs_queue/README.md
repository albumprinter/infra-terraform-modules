# Module: SQS Queue

This module provisions a SQS Queue with an optional queue policy.

## Examples 

#### Minimal configuration
```
module "sqs_queue" {
  source  = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/sqs_queue"

  tag_domain = var.tag_domain
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
}
```

#### Including queue policy
```
module "sqs_queue" {
  source  = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/sqs_queue"

  name = "my_queue"

  policy_statements = [
    {
      "Effect": "Allow",
      "Action": ["sqs:SendMessage"],
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "arn:aws:lambda:eu-west-1:*:function:EXAMPLE"
        }
      }
    }
  ]

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

* **sqs_queue**: contains all attributes available in Terraform for SQS Queue resources