# Module: Config Rule - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

#### Config Rule

- [config_rule_source_detail](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#source_detail)
  - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    - [event_source](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#event_source)
    - [maximum_execution_frequency](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#maximum_execution_frequency-1)
    - [message_type](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#message_type)
    - Example:
  ```
  config_rule_source_detail = [
    {
      event_source = "..."
      maximum_execution_frequency = "..."
      message_type  = "..."
    }
  ]
  ```
- [config_rule_description](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#description)
- [config_rule_input_parameters](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#input_parameters)
- [config_rule_maximum_execution_frequency](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#maximum_execution_frequency)
- [config_rule_scope](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#scope)
  - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    - [compliance_resource_id](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#compliance_resource_id)
    - [compliance_resource_types](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#compliance_resource_types)
    - [tag_key](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#tag_key)
    - [tag_value](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html#tag_value)
    - Example:
  ```
  config_rule_scope = [
    {
      compliance_resource_id = "..."
      compliance_resource_types   = "..."
      tag_key  = "..."
      tag_value = "..."
    }
  ]
  ```
