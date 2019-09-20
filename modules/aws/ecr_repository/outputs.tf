output "ecr_repository" {
  value = aws_ecr_repository.repo[0]
}

output "ecr_repository_policy" {
  value = aws_ecr_repository_policy.policy[0]
}

output "ecr_lifecycle_policy" {
  value = aws_ecr_lifecycle_policy.lifecycle_policy[0]
}
