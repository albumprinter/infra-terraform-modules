# Module: ECR Repository

This module provisions a ECR Repository along with the following optional resources:

* ECR Repository Policy
* ECR Repository Lifecycle Policy

## Examples 

#### Minimal configuration
```
module "ecr_repository" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/ecr_repository"

  name = "my_ecr_repository"
  
  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain = var.tag_domain
}
```

#### Sharing with all accounts from an AWS Organization
```
module "ecr_repository" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/ecr_repository"

  name = "my_shared_ecr_repository"
  aws_organization_id = "o-123456"
  
  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain = var.tag_domain
}
```

#### Restricting the maximum number of images to 10
```
module "ecr_repository" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/ecr_repository"

  name = "my_lifecycled_ecr_repository"
  max_number_of_images = 10
  
  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain = var.tag_domain
}
```

## Required parameters

The following parameters are considered required.

* [name](https://www.terraform.io/docs/providers/aws/r/ecr_repository.html#name)

#### Tags
Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

* **tag_environment**
* **tag_cost_center**
* **tag_domain**

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

* **ecr_repository**: contains all attributes available in Terraform for ECR Repository resources
* **ecr_repository_policy**: contains all attributes available in Terraform for ECR Repository Policy resources
* **ecr_lifecycle_policy**: contains all attributes available in Terraform for ECR Repository Lifecycle Policy resources
