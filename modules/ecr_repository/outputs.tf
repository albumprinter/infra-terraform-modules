output "repository" {
  value = aws_ecr_repository.repo[0]
}

output "policy" {
  value = aws_ecr_repository_policy.policy[0]
}

output "lifecycle_policy" {
  value = aws_ecr_lifecycle_policy.lifecycle_policy[0]
}
