# Module: ECS Task - Patterns

This module supports the following pattern:

- CloudWatch Rule (scheduled or event pattern) + ECS Task

This page contains all the required and optional parameters that can be used to customized your deployment.

## CloudWatch Event Rule + ECS Task

#### CloudWatch Event Rule

This resource **will be created only if** either `event_rule_event_pattern` or `event_rule_schedule_expression` is configured. If so, there are required and optional parameters as described below.

##### Required

- [event_rule_event_pattern](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#event_pattern)
  - Note: Required, if `event_rule_schedule_expression` isn't specified
- [event_rule_schedule_expression](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#schedule_expression)
  - Note: Required, if `event_rule_event_pattern` isn't specified

##### Optional

- [event_rule_description](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#description)
- [event_rule_name](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#name)
  - Note: by default, uses the same value provided for the `task_family`
- [event_rule_name_prefix](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#name_prefix)
- [event_rule_role_arn](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#role_arn)
- [event_rule_is_enabled](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#is_enabled)

---

#### CloudWatch Event Target

This resource **will be created only if** a `CloudWatch Event Rule` is configured.

##### Required

- [event_target_arn](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#arn)
- [event_target_network_configuration_subnets](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#subnets)
- [event_target_network_configuration_security_groups](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#security_groups)

##### Optional

- [event_target_group](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#group)
- [event_target_launch_type](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#launch_type)
- [event_target_network_configuration_assign_public_ip](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#assign_public_ip)
- [event_target_platform_version](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#platform_version)
- [event_target_task_count](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#task_count)
- [event_target_target_id](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#target_id)
- [event_target_input](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#input)
- [event_target_input_path](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#input_path)

---

#### IAM Role for CloudWatch Event Rule

This resource **will be created only if** a `CloudWatch Event Rule` is configured.

##### Optional

- [event_rule_iam_role_description](https://www.terraform.io/docs/providers/aws/r/iam_role.html#description)
- [event_rule_iam_role_force_detach_policies](https://www.terraform.io/docs/providers/aws/r/iam_role.html#force_detach_policies)
- [event_rule_iam_role_max_session_duration](https://www.terraform.io/docs/providers/aws/r/iam_role.html#max_session_duration)
- [event_rule_iam_role_name](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name)
  - Note: by default, uses the same value provided for the `task_family`
- [event_rule_iam_role_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name_prefix)
- [event_rule_iam_role_path](https://www.terraform.io/docs/providers/aws/r/iam_role.html#path)
- [event_rule_iam_role_permissions_boundary](https://www.terraform.io/docs/providers/aws/r/iam_role.html#permissions_boundary)

---

#### IAM Policy for CloudWatch Event Rule

This resource **will be created only if** a `CloudWatch Event Rule` is configured.

##### Optional

- [event_rule_iam_role_policy_description](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#description)
- [event_rule_iam_role_policy_name](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name)
  - Note: by default, uses the same value provided for the `task_family`
- [event_rule_iam_role_policy_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name_prefix)
- [event_rule_iam_role_policy_path](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#path)
