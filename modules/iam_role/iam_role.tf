resource "aws_iam_role" "role" {
  # Required
  assume_role_policy = templatefile("${path.module}/templates/assume_role_policy.tpl", {
    principal_type   = var.assume_role_principal_type,
    principal_target = var.assume_role_principal
  })

  # Optional
  description           = var.role_description
  force_detach_policies = var.role_force_detach_policies
  max_session_duration  = var.role_max_session_duration
  name                  = var.role_name
  name_prefix           = var.role_name_prefix
  path                  = var.role_path
  permissions_boundary  = var.role_permissions_boundary
  tags                  = local.tags
}

resource "aws_iam_policy" "policy" {
  count = length(var.policy_statements) > 0 ? 1 : 0

  # Required
  policy = templatefile("${path.module}/templates/permissions_policy.tpl", {
    policy_statements = var.policy_statements
  })

  # Optional
  description = var.policy_description
  name        = var.policy_name
  name_prefix = var.policy_name_prefix
  path        = var.policy_path
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  count = length(var.policy_statements) > 0 ? 1 : 0

  role       = "${aws_iam_role.role.name}"
  policy_arn = "${aws_iam_policy.policy[0].arn}"
}