output "role" {
  value = aws_iam_role.role[0]
}
output "policy" {
  value = aws_iam_policy.policy[0]
}