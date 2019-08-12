resource "aws_ecs_task_definition" "task" {
  # Required
  family = var.task_family
  container_definitions = var.task_container_definitions

  # Optional
  task_role_arn = var.task_role_arn != null ? var.task_role_arn : module.task_role.role.arn
  execution_role_arn = var.task_execution_role_arn != null ? var.task_execution_role_arn : module.execution_role.role.arn
  network_mode = var.task_network_mode
  ipc_mode = var.task_ipc_mode
  pid_mode = var.task_pid_mode 
  
  dynamic "volume" {
    for_each = [for task_volume in var.task_volumes: {
      name = task_volume.volume_name
      host_path = lookup(task_volume, "volume_host_path ", null)
      docker_volume_configuration_scope = lookup(task_volume, "docker_volume_configuration_scope", null)
      docker_volume_configuration_autoprovision = lookup(task_volume, "docker_volume_configuration_autoprovision ", null)
      docker_volume_configuration_driver = lookup(task_volume, "docker_volume_configuration_driver ", null)
      docker_volume_configuration_driver_opts = lookup(task_volume, "docker_volume_configuration_driver_opts ", null)
      docker_volume_configuration_labels = lookup(task_volume, "docker_volume_configuration_labels", null)
    }]

    content {
      name = volume.value.name
      host_path = volume.value.host_path
      docker_volume_configuration {
        scope = volume.value.docker_volume_configuration_scope
        autoprovision = volume.value.docker_volume_configuration_autoprovision
        driver = volume.value.docker_volume_configuration_driver
        driver_opts = volume.value.docker_volume_configuration_driver_opts
        labels = volume.value.docker_volume_configuration_labels
      }
    }
  }

  dynamic "placement_constraints" {
    for_each = [for constraint in var.task_placement_constraints: {
      type = constraint.type
      expression = lookup(constraint, "expression", null)
    }]

    content {
      type = placement_constraints.value.type
      expression = placement_constraints.value.expression
    }
  }

  cpu = var.task_cpu
  memory = var.task_memory
  requires_compatibilities = var.task_requires_compatibilities  

  dynamic "proxy_configuration" {
    for_each = [for configuration in var.task_proxy_configuration: {
      container_name = configuration.container_name
      properties = lookup(configuration, "properties", null)
      type = lookup(configuration, "type ", null)
    }]

    content {
      container_name = proxy_configuration.value.container_name
      properties = proxy_configuration.value.properties
      type = proxy_configuration.value.type
    }
  }

  tags = local.tags
}

module "log_group" {
  source = "../cloudwatch_log_group"

  # Required
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain

  # Optional
  name              = var.log_group_name != null ? var.log_group_name : "/ecs/${var.task_family}"
  retention_in_days = var.log_group_retention_in_days
  kms_key_id        = var.log_group_kms_key_id
  tag_others        = var.tag_others
}

module "task_role" {
  source = "../iam_role"

  assume_role_principal = "ecs-tasks.amazonaws.com"
  # Required  
  policy_statements = var.task_role_policy_statements
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain

  # Optional
  role_description           = var.task_role_description
  role_force_detach_policies = var.task_role_force_detach_policies
  role_max_session_duration  = var.task_role_max_session_duration
  role_name                  = var.task_role_name != null ? var.task_role_name : "${var.task_family}_task"
  role_name_prefix           = var.task_role_name_prefix
  role_path                  = var.task_role_path
  role_permissions_boundary  = var.task_role_permissions_boundary
  policy_description    = var.task_role_policy_description
  policy_name           = var.task_role_policy_name != null ? var.task_role_policy_name : "${var.task_family}_task"
  policy_name_prefix    = var.task_role_policy_name_prefix
  policy_path           = var.task_role_policy_path
  tag_others            = var.tag_others
}

module "execution_role" {
  source = "../iam_role"

  assume_role_principal = "ecs-tasks.amazonaws.com"
  # Required  
  policy_statements = [
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage"
      ],
      "Resource": ["*"]
    },
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": ["*"]
    }
  ]

  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain

  # Optional
  role_description           = var.execution_role_description
  role_force_detach_policies = var.execution_role_force_detach_policies
  role_max_session_duration  = var.execution_role_max_session_duration
  role_name                  = var.execution_role_name != null ? var.execution_role_name : "${var.task_family}_execution"
  role_name_prefix           = var.execution_role_name_prefix
  role_path                  = var.execution_role_path
  role_permissions_boundary  = var.execution_role_permissions_boundary
  policy_description    = var.execution_role_policy_description
  policy_name           = var.execution_role_policy_name != null ? var.execution_role_policy_name : "${var.task_family}_execution"
  policy_name_prefix    = var.execution_role_policy_name_prefix
  policy_path           = var.execution_role_policy_path
  tag_others            = var.tag_others
}