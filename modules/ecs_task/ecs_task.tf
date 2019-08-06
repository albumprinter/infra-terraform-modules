module "task" {
  source = "../../resources/ecs_task_definition"

  # Required
  family = var.task_family
  container_definitions = var.task_container_definitions

  # Optional
  task_role_arn = var.task_role_arn != null ? var.task_role_arn : module.task_role.resource.arn
  execution_role_arn = var.execution_role_arn != null ? var.execution_role_arn : module.execution_role.resource.arn
  network_mode = var.task_network_mode
  ipc_mode = var.task_ipc_mode
  pid_mode = var.task_pid_mode 
  volumes = var.task_volumes
  placement_constraints = var.task_placement_constraints
  cpu = var.task_cpu
  memory = var.task_memory
  requires_compatibilities = var.task_requires_compatibilities 
  proxy_configuration = var.task_proxy_configuration
  tags = local.tags
}

module "log_group" {
  source = "../../resources/cloudwatch_log_group"

  # Required
  tags = local.tags

  # Optional
  name              = var.log_group_name != null ? var.log_group_name : "/ecs/${var.task_family}"
  retention_in_days = var.log_group_retention_in_days
  kms_key_id        = var.log_group_kms_key_id
}

module "task_role" {
  source = "../../resources/iam_role"

  assume_role_principal = "ecs-tasks.amazonaws.com"
  # Required  
  policy_statements = var.task_role_policy_statements
  tags = local.tags

  # Optional
  description           = var.task_role_description
  force_detach_policies = var.task_role_force_detach_policies
  max_session_duration  = var.task_role_max_session_duration
  name                  = var.task_role_name != null ? var.task_role_name : "${var.task_family}_task"
  name_prefix           = var.task_role_name_prefix
  path                  = var.task_role_path
  permissions_boundary  = var.task_role_permissions_boundary
  policy_description    = var.task_role_policy_description
  policy_name           = var.task_role_policy_name != null ? var.task_role_policy_name : "${var.task_family}_task"
  policy_name_prefix    = var.task_role_policy_name_prefix
  policy_path           = var.task_role_policy_path
}

module "execution_role" {
  source = "../../resources/iam_role"

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

  tags = local.tags

  # Optional
  description           = var.execution_role_description
  force_detach_policies = var.execution_role_force_detach_policies
  max_session_duration  = var.execution_role_max_session_duration
  name                  = var.execution_role_name != null ? var.execution_role_name : "${var.task_family}_execution"
  name_prefix           = var.execution_role_name_prefix
  path                  = var.execution_role_path
  permissions_boundary  = var.execution_role_permissions_boundary
  policy_description    = var.execution_role_policy_description
  policy_name           = var.execution_role_policy_name != null ? var.execution_role_policy_name : "${var.task_family}_execution"
  policy_name_prefix    = var.execution_role_policy_name_prefix
  policy_path           = var.execution_role_policy_path
}