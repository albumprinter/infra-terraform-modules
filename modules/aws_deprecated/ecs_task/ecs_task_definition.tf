resource "aws_ecs_task_definition" "task" {
  # Required
  family                = var.task_family
  container_definitions = var.task_container_definitions

  # Interally handled
  task_role_arn      = var.task_role_arn != null ? var.task_role_arn : module.task_role.iam_role.arn
  execution_role_arn = var.task_execution_role_arn != null ? var.task_execution_role_arn : module.execution_role.iam_role.arn

  # Optional  
  network_mode = var.task_network_mode
  ipc_mode     = var.task_ipc_mode
  pid_mode     = var.task_pid_mode

  dynamic "volume" {
    for_each = [for task_volume in var.task_volumes : {
      name                                      = task_volume.volume_name
      host_path                                 = lookup(task_volume, "volume_host_path", null)
      docker_volume_configuration_scope         = lookup(task_volume, "docker_volume_configuration_scope", null)
      docker_volume_configuration_autoprovision = lookup(task_volume, "docker_volume_configuration_autoprovision", null)
      docker_volume_configuration_driver        = lookup(task_volume, "docker_volume_configuration_driver", null)
      docker_volume_configuration_driver_opts   = lookup(task_volume, "docker_volume_configuration_driver_opts", null)
      docker_volume_configuration_labels        = lookup(task_volume, "docker_volume_configuration_labels", null)
    }]

    content {
      name      = volume.value.name
      host_path = volume.value.host_path
      docker_volume_configuration {
        scope         = volume.value.docker_volume_configuration_scope
        autoprovision = volume.value.docker_volume_configuration_autoprovision
        driver        = volume.value.docker_volume_configuration_driver
        driver_opts   = volume.value.docker_volume_configuration_driver_opts
        labels        = volume.value.docker_volume_configuration_labels
      }
    }
  }

  dynamic "placement_constraints" {
    for_each = [for constraint in var.task_placement_constraints : {
      type       = constraint.type
      expression = lookup(constraint, "expression", null)
    }]

    content {
      type       = placement_constraints.value.type
      expression = placement_constraints.value.expression
    }
  }

  cpu                      = var.task_cpu
  memory                   = var.task_memory
  requires_compatibilities = var.task_requires_compatibilities

  dynamic "proxy_configuration" {
    for_each = [for configuration in var.task_proxy_configuration : {
      container_name = configuration.container_name
      properties     = lookup(configuration, "properties", null)
      type           = lookup(configuration, "type", null)
    }]

    content {
      container_name = proxy_configuration.value.container_name
      properties     = proxy_configuration.value.properties
      type           = proxy_configuration.value.type
    }
  }

  tags = merge(var.tags, {
    Name = var.task_family
  })
}

# -------------------- Variables --------------------

variable "task_family" {}
variable "task_container_definitions" {}
variable "task_role_arn" {
  default = null
}
variable "task_execution_role_arn" {
  default = null
}
variable "task_network_mode" {
  default = null
}
variable "task_ipc_mode" {
  default = null
}
variable "task_pid_mode" {
  default = null
}
variable "task_volumes" {
  default = []
}
variable "task_placement_constraints" {
  default = []
}
variable "task_cpu" {
  default = "256"
}
variable "task_memory" {
  default = "512"
}
variable "task_requires_compatibilities" {
  default = null
}
variable "task_proxy_configuration" {
  default = []
}
