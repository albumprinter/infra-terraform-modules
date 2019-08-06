# Module: ECS Task - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

They follow the same name as in the offical Terraform documentation with the addition of a prefix (e.g. *task_*) to identify to which resource does the parameter belong to.

#### Tags

* **tag_others**: map containing any extra tags that should be added to the resources except for the required tags.
  * Note: The tag `name` shouldn't be used in this map, otherwise all resources will be tagged with the same value.

------

#### ECS Task Definition

* [task_role_arn](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#task_role_arn)
* [task_execution_role_arn](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#execution_role_arn)
* [task_network_mode](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#network_mode)
* [task_ipc_mode](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#ipc_mode)
* [task_pid_mode](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#pid_mode)
* [task_cpu](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#cpu)
  * Note: by default, uses the value `256` if not specified
* [task_memory](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#memory)
  * Note: by default, uses the value `512` if not specified
* [task_requires_compatibilities](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#requires_compatibilities)
* [task_volumes](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#volume)
  * Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    * [name](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#name)
    * [host_path](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#host_path)
    * [docker_volume_configuration_scope](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#scope)
    * [docker_volume_configuration_autoprovision](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#autoprovision)
    * [docker_volume_configuration_driver](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#driver)
    * [docker_volume_configuration_driver_opts](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#driver_opts)
    * [docker_volume_configuration_labels](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#labels)
  * Example:
```
task_volumes = [
  {
    name = "..."
    host_path = "..."
    docker_volume_configuration_scope = "..."
    docker_volume_configuration_autoprovision = "..."
    docker_volume_configuration_driver = "..."
    docker_volume_configuration_driver_opts = "..."
    docker_volume_configuration_labels = "..."
  }
]
```
* [task_placement_constraints](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#placement_constraints)
  * Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    * [type](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#type)
    * [expression](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#expression)
  * Example:
```
task_placement_constraints = [
  {
    type = "..."
    expression = "..."
  }
]
```
* [task_proxy_configuration](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#proxy_configuration)
  * Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    * [container_name](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#container_name)
    * [properties](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#properties)
    * [type](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#type-1)
  * Example:
```
event_target_batch_target = [
  {
    container_name = "..."
    properties = "..."
    type = "..."
  }
]
```

------

#### IAM Role (Execution)

* [execution_role_description](https://www.terraform.io/docs/providers/aws/r/iam_role.html#description)
* [execution_role_force_detach_policies](https://www.terraform.io/docs/providers/aws/r/iam_role.html#force_detach_policies)
* [execution_role_max_session_duration](https://www.terraform.io/docs/providers/aws/r/iam_role.html#max_session_duration)
* [execution_role_name](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name)
* [execution_role_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name_prefix)
* [execution_role_path](https://www.terraform.io/docs/providers/aws/r/iam_role.html#path)
* [execution_role_permissions_boundary](https://www.terraform.io/docs/providers/aws/r/iam_role.html#permissions_boundary)
* [execution_role_policy_description](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#description)
* [execution_role_policy_name](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name)
* [execution_role_policy_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name_prefix)
* [execution_role_policy_path](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#path)

------

#### IAM Role (Task)

* **task_role_policy_statements**: IAM policy statements granting permissions to the containers created by the task.
* [task_role_description](https://www.terraform.io/docs/providers/aws/r/iam_role.html#description)
* [task_role_force_detach_policies](https://www.terraform.io/docs/providers/aws/r/iam_role.html#force_detach_policies)
* [task_role_max_session_duration](https://www.terraform.io/docs/providers/aws/r/iam_role.html#max_session_duration)
* [task_role_name](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name)
* [task_role_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name_prefix)
* [task_role_path](https://www.terraform.io/docs/providers/aws/r/iam_role.html#path)
* [task_role_permissions_boundary](https://www.terraform.io/docs/providers/aws/r/iam_role.html#permissions_boundary)
* [task_role_policy_description](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#description)
* [task_role_policy_name](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name)
* [task_role_policy_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name_prefix)
* [task_role_policy_path](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#path)