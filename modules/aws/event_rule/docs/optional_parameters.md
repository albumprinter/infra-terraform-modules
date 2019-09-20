# Module: Event Rule - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

They follow the same name as in the offical Terraform documentation with the addition of a prefix (e.g. *event_rule_*) to identify to which resource does the parameter belong to.

#### Tags

* **tag_others**: map containing any extra tags that should be added to the resources except for the required tags.
  * Note: The tag `name` shouldn't be used in this map, otherwise all resources will be tagged with the same value.

------

#### CloudWatch Event Rule

* [event_rule_description](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#description)
* [event_rule_name](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#name)
* [event_rule_name_prefix](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#name_prefix)
* [event_rule_role_arn](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#role_arn)
* [event_rule_is_enabled](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#is_enabled)

------

#### CloudWatch Event Target

* [event_target_target_id](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#target_id)
* [event_target_input](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#input)
* [event_target_input_path](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#input_path)
* [event_target_role_arn](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#role_arn)
* [event_target_batch_target](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#batch_target)
  * Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    * [job_definition](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#job_definition)
    * [job_name](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#job_name)
    * [array_size](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#array_size)
    * [job_attempts](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#job_attempts)
  * Example:
```
event_target_batch_target = [
  {
    job_definition = "..."
    job_name = "..."
    array_size = "..."
    job_attempts = "..."
  }
]
```
* [event_target_ecs_target](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#ecs_target)
* Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    * [task_definition_arn](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#task_definition_arn)
    * [group](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#group)
    * [launch_type](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#launch_type)
    * [platform_version](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#platform_version)
    * [task_count](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#task_count)
    * [network_configuration_subnets](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#subnets)
    * [network_configuration_security_groups](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#security_groups)
    * [network_configuration_assign_public_ip](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#assign_public_ip)
  * Example:
```
event_target_ecs_target = [
  {
    task_definition_arn = "..."
    group = "..."
    launch_type = "..."
    network_configuration_subnets = "..."
    network_configuration_security_groups = "..."
    network_configuration_assign_public_ip = "..."
    platform_version = "..."
    task_count = "..."
  }
]
```
* [event_target_input_transformer](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#input_transformer)
  * Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    * [input_template](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#input_template)
    * [input_paths](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#input_paths)
  * Example:
```
event_target_input_transformer = [
  {
    input_template = "..."
    input_paths = "..."
  }
]
```
* [event_target_kinesis_target](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#kinesis_target)
  * Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    * [partition_key_path](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#partition_key_path)
  * Example:
```
event_target_kinesis_target = [
  {
    partition_key_path = "..."
  }
]
```
* [event_target_run_command_targets](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#run_command_targets)
  * Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    * [key](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#key)
    * [values](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#values)
  * Example:
```
event_target_run_command_targets = [
  {
    key = "..."
    values = "..."
  }
]
```
* [event_target_sqs_target](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#sqs_target)
  * Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    * [message_group_id](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#message_group_id)
  * Example:
```
event_target_sqs_target = [
  {
    message_group_id = "..."
  }
]
```
