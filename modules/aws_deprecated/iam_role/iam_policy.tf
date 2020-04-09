resource "aws_iam_policy" "policy" {
  count = var.provision == true && length(var.policy_statements) > 0 ? 1 : 0

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
  count = var.provision == true && length(var.policy_statements) > 0 ? 1 : 0

  role       = aws_iam_role.role[0].name
  policy_arn = aws_iam_policy.policy[0].arn
}

# -------------------- Variables --------------------
variable "policy_statements" {
  type    = list
  default = []
}
variable "policy_description" {
  default = null
}
variable "policy_name" {
  default = null
}
variable "policy_name_prefix" {
  default = null
}
variable "policy_path" {
  default = null
}