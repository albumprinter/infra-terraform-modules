# Module: CodeBuild Project

This module provisions a CodeBuild Project along with the following resources:

- IAM Role with minimum permissions required
- CloudWatch Log Group with a default retention period of 30 days

## Examples

#### Minimal configuration

```
module "codebuild_project" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws_deprecated/codebuild_project"

  codebuild_project_name = "infra-tf-modules-examples-codebuild-project"

  codebuild_project_source = [
    {
      type = "GITHUB"
      location = "https://github.com/albumprinter/infra-terraform-modules"
    }
  ]

  codebuild_project_artifacts = [
    {
      type     = "S3"
      location = "${aws_s3_bucket.artifacts.id}"
    }
  ]

  iam_role_policy_statements = [
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject"
      ],
      "Resource": [
        "${aws_s3_bucket.artifacts.arn}"
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

#### VPC Access

```
module "codebuild_project_vpc" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws_deprecated/codebuild_project"

  codebuild_project_name = "infra-tf-modules-examples-codebuild-project-vpc"

  codebuild_project_source = [
    {
      type = "GITHUB"
      location = "https://github.com/albumprinter/infra-terraform-modules"
    }
  ]

  codebuild_project_artifacts = [
    {
      type     = "S3"
      location = "${aws_s3_bucket.artifacts.id}"
    }
  ]

  codebuild_project_vpc_config = [
    {
      subnets            = data.aws_subnet_ids.private.ids,
      security_group_ids = [module.security_group.security_group.id]
      vpc_id             = data.aws_vpc.vpc.id
    }
  ]

  iam_role_policy_statements = [
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject"
      ],
      "Resource": [
        "${aws_s3_bucket.artifacts.arn}"
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

- [codebuild_project_name](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#name)

- [codebuild_project_artifacts](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#artifacts)
  - Note: This attribute should be passed as an array containing one object with the following parameters:
    - [type](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#type)
    - [artifact_identifier](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#artifact_identifier)
    - [encryption_disabled](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#encryption_disabled)
    - [override_artifact_name](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#override_artifact_name)
    - [location](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#location)
    - [name](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#name-1)
    - [namespace_type](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#namespace_type)
    - [packaging](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#packaging)
    - [path](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#path)
  - Example:

```
codebuild_project_artifacts = [
  {
    type     = "S3"
    location = "${aws_s3_bucket.artifacts.id}"
  }
]
```

- [codebuild_project_source](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#source)

  - Note: This attribute should be passed as an array containing one object with the following parameters:
    - [type](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#type-4)
    - [auth](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#auth)
      - Note: This attribute should be passed as an array containing one object with the following parameters:
        - [type](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#type-5)
        - [resource](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#resource)
    - [buildspec](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#buildspec)
    - [git_clone_depth](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#git_clone_depth)
    - [insecure_ssl](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#insecure_ssl)
    - [location](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#location-3)
    - [report_build_status](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#report_build_status)
  - Example:

  ```
  codebuild_project_source = [
    {
      type = "GITHUB"
      location = "https://github.com/albumprinter/infra-terraform-modules"
      auth = [
        {
          type = "OAUTH"
          resource = "..."
        }
      ]
    }
  ]
  ```

- **tags**: Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

- **cloudwatch_log_group**: contains all attributes available in Terraform for CloudWatch Log Group resources
- **codebuild_project**: contains all attributes available in Terraform for CodeBuild Project resources
- **iam_role**: contains all attributes available in Terraform for IAM Role resources
