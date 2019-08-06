resource "aws_ecs_task_definition" "task" {
  # Required
  family = var.family
  container_definitions = var.container_definitions

  # Optional
  task_role_arn = var.task_role_arn
  execution_role_arn = var.execution_role_arn
  network_mode = var.network_mode
  ipc_mode = var.ipc_mode
  pid_mode = var.pid_mode
  
  dynamic "volume" {
    for_each = [for task_volume in var.volumes: {
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
    for_each = [for constraint in var.placement_constraints: {
      type = constraint.type
      expression = lookup(constraint, "expression", null)
    }]

    content {
      type = placement_constraints.value.type
      expression = placement_constraints.value.expression
    }
  }

  cpu = var.cpu
  memory = var.memory
  requires_compatibilities = var.requires_compatibilities 

  dynamic "proxy_configuration" {
    for_each = [for configuration in var.proxy_configuration: {
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

  tags = var.tags
}