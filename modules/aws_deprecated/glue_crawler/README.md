# Module: Glue Crawler

This module provisions a Glue Crawler along with the following resources:

- IAM Role with minimum permissions required

## Examples

#### Minimal configuration for a S3 target

```
module "glue_crawler_s3_target" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/glue_crawler"

  glue_crawler_name          = ".."
  glue_crawler_database_name = "..."  
  glue_crawler_s3_target     = [
    {
      path = "s3://..."
    }
  ]  

  iam_role_policy_statements = [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        ...,
        "${...}/*"
      ]
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

- [glue_crawler_name](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#name)
- [glue_crawler_database_name](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#database_name)

- **tags**: Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

- **glue_crawler**: contains all attributes available in Terraform for Glue Crawler resources
- **iam_role**: contains all attributes available in Terraform for IAM Role resources
