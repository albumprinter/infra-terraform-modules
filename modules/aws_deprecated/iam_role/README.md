# Module: IAM Role

This module provisions an IAM Role along with an optional IAM policy.

## Examples

#### Minimal configuration

```
module "role" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/iam_role"

  assume_role_principal = "lambda.amazonaws.com"

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

#### With optional IAM policy

```
module "role" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/iam_role"

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

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

## Required parameters

The following parameters are considered required.

- **assume_role_principal**: specifies who is authorized to assume the role (e.g. lambda.amazonaws.com, events.amazonaws.com, etc)
- **tags**: Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

- **iam_role**: contains all attributes available in Terraform for IAM Role resources
- **iam_policy**: contains all attributes available in Terraform for IAM Policy resources
