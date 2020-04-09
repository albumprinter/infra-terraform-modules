# Module: Route 53 Zone

This module provisions a Route 53 Hosted Zone along with any necessary records.

## Examples

#### Minimal configuration

```
module "hosted_zone_no_records" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/route53_zone"

  zone_name = "infra.modules.test"

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

#### Including records

```
module "hosted_zone" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/route53_zone"

  zone_name = "infra.modules.test"
  records = [
    {
      name    = "infra.modules.test"
      type    = "A"
      ttl     = "300"
      records = ["127.0.0.1"]
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

- [zone_name](https://www.terraform.io/docs/providers/aws/r/route53_zone.html#name)
- **tags**: Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

- **route53_zone**: contains all attributes available in Terraform for Route53 Hosted Zone resources
- **route53_records**: _list_ containing elements with all attributes available in Terraform for Route53 Record resources
