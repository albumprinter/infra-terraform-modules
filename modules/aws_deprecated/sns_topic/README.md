# Module: SNS Topic

This module provisions a SNS Topic with two optional resources:

- SNS Topic Subscription
- SNS Topic Policy

## Examples

#### Minimal configuration

```
module "sns_topic" {
  source  = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws_deprecated/sns_topic"

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

#### Including a topic subscription

```
module "sns_topic" {
  source  = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws_deprecated/sns_topic"

  sns_topic_subscription_protocol = "lambda"
  sns_topic_subscription_endpoint = "arn:aws:lambda:eu-west-1:*:function:MY_FUNCTION"

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

- **sns_topic**: contains all attributes available in Terraform for SNS Topic resources
- **sns_topic_subscription**: contains all attributes available in Terraform for SNS Topic Subscription resources
