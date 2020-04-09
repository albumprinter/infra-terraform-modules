# Module: ECR Repository

This module provisions a ECR Repository along with the following optional resources:

- ECR Repository Policy
- ECR Repository Lifecycle Policy

## Examples

#### Minimal configuration

```
module "ecr_repository" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/ecr_repository"

  name = "my_ecr_repository"

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

#### Sharing with all accounts from an AWS Organization

```
module "ecr_repository" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/ecr_repository"

  name = "my_shared_ecr_repository"
  aws_organization_id = "o-123456"

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

#### Restricting the maximum number of images to 10

```
module "ecr_repository" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/ecr_repository"

  name = "my_lifecycled_ecr_repository"
  max_number_of_images = 10

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

## Required parameters

The following parameters are considered required.

- [name](https://www.terraform.io/docs/providers/aws/r/ecr_repository.html#name)
- **tags**: Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

- **ecr_repository**: contains all attributes available in Terraform for ECR Repository resources
- **ecr_repository_policy**: contains all attributes available in Terraform for ECR Repository Policy resources
- **ecr_lifecycle_policy**: contains all attributes available in Terraform for ECR Repository Lifecycle Policy resources
