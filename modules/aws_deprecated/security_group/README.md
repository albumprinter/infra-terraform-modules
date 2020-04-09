# Module: Security Group

This module provisions a Security Group with optional ingress and egress rules.

## Examples

#### Minimal configuration

```
module "security_group" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/security_group"

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

#### Including Egress rule

```
module "security_group" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/security_group"

  name = "infra_tf_modules_example_lambda_function"
  vpc_id = data.aws_vpc.main.id
  egress_rules = [
    {
      from_port = 0
      to_port   = 0
      protocol  = "-1"
      cidr_blocks = ["0.0.0.0/0"]
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

- **security_group**: contains all attributes available in Terraform for Security Group resources
