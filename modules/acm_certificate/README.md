# Module: ACM Certificate

This module provisions an Amazon Certificate Manager Certificate.

In case a map of hosted zone IDs is provided, DNS validation records will be created to validate the certificate automatically.
 * Note: there is a **bug in Terraform** where the state file doesn't populate the validation options in the first run, requiring the module to be executed twice

## Examples 

#### Minimal configuration
```
module "acm_certificate" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/acm_certificate"

  domain_name = "*.sandbox.infra.albelli.com"
  
  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}
```

#### Using DNS Validation
```
module "acm_certificate" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/acm_certificate"

  domain_name = "*.sandbox.infra.albelli.com"
  
  hosted_zone_ids = {
    "*.sandbox.infra.albelli.com" = "Z3D9HBL9U0Q0MB"
  }

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}
```

#### Using Subject Alternative Names
```
module "acm_certificate_alternative_domain_names" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/acm_certificate"

  domain_name = "*.sandbox.infra.albelli.com"
  
  subject_alternative_names = [
    "sandbox.infra.albelli.com",
    "tftest.sandbox.infra.albelli.com"
  ]
  
  hosted_zone_ids = {
    "*.sandbox.infra.albelli.com" = "Z3D9HBL9U0Q0MB",
    "sandbox.infra.albelli.com" = "Z3D9HBL9U0Q0MB",
    "tftest.sandbox.infra.albelli.com" = "Z3D9HBL9U0Q0MB",
  }

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}
```

## Required parameters

The following parameters are considered required.

* [domain_name](https://www.terraform.io/docs/providers/aws/r/acm_certificate.html#domain_name)

#### Tags
Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

* **tag_environment**
* **tag_cost_center**
* **tag_domain**

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)
