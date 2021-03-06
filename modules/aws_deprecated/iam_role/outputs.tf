output "iam_role" {
  value = var.provision == true ? aws_iam_role.role[0] : null
}
output "iam_policy" {
  value = var.provision == true && length(var.policy_statements) > 0 ? aws_iam_policy.policy[0] : null
}