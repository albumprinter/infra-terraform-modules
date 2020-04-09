# Module: Step Function State Machine

This module provisions a Step Function State Machine along with a IAM Role.

## Examples

#### Minimal configuration

```
module "state_machine" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/sfn_state_machine"

  sfn_state_machine_name       = "my-state-machine"
  sfn_state_machine_definition = "..."

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

## Required parameters

The following parameters are considered required.

- [sfn_state_machine_name](https://www.terraform.io/docs/providers/aws/r/sfn_state_machine.html#name)
- [sfn_state_machine_definition](https://www.terraform.io/docs/providers/aws/r/sfn_state_machine.html#definition)
- **tags**: Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

- **sfn_state_machine**: contains all attributes available in Terraform for Step Function State Machine resources
- **iam_role**: contains all attributes available in Terraform for IAM Role resources
