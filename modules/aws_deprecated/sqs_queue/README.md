# Module: SQS Queue

This module provisions a SQS Queue with an optional queue policy.

## Examples

#### Minimal configuration

```
module "sqs_queue" {
  source  = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws_deprecated/sqs_queue"

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

#### Including queue policy

```
module "sqs_queue" {
  source  = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws_deprecated/sqs_queue"

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

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

## Required parameters

- **tags**: Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

- **sqs_queue**: contains all attributes available in Terraform for SQS Queue resources
