output "iam_role" {
  value = aws_iam_role.role[0]
}
output "iam_policy" {
  value = aws_iam_policy.policy[0]
}