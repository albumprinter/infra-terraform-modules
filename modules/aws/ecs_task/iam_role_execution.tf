module "execution_role" {
  source = "../iam_role"

  # Required
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain      = var.tag_domain

  # Interally handled
  assume_role_principal = "ecs-tasks.amazonaws.com"
  policy_statements = [
    {
      "Effect" : "Allow",
      "Action" : [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage"
      ],
      "Resource" : ["*"]
    },
    {
      "Effect" : "Allow",
      "Action" : [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource" : ["*"]
    }
  ]

  # Optional
  role_description           = var.execution_role_description
  role_force_detach_policies = var.execution_role_force_detach_policies
  role_max_session_duration  = var.execution_role_max_session_duration
  role_name                  = var.execution_role_name != null ? var.execution_role_name : "${var.task_family}_execution"
  role_name_prefix           = var.execution_role_name_prefix
  role_path                  = var.execution_role_path
  role_permissions_boundary  = var.execution_role_permissions_boundary

  policy_description = var.execution_role_policy_description
  policy_name        = var.execution_role_policy_name != null ? var.execution_role_policy_name : "${var.task_family}_execution"
  policy_name_prefix = var.execution_role_policy_name_prefix
  policy_path        = var.execution_role_policy_path

  tag_others = var.tag_others
}

# -------------------- Variables --------------------

variable "execution_role_description" {
  default = null
}
variable "execution_role_force_detach_policies" {
  default = null
}
variable "execution_role_max_session_duration" {
  default = null
}
variable "execution_role_name" {
  default = null
}
variable "execution_role_name_prefix" {
  default = null
}
variable "execution_role_path" {
  default = null
}
variable "execution_role_permissions_boundary" {
  default = null
}
variable "execution_role_policy_description" {
  default = null
}
variable "execution_role_policy_name" {
  default = null
}
variable "execution_role_policy_name_prefix" {
  default = null
}
variable "execution_role_policy_path" {
  default = null
}