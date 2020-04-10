output "ecr_repository" {
  value = var.provision == true ? aws_ecr_repository.repo[0] : null
}

output "ecr_repository_policy" {
  value = var.provision == true && var.aws_organization_id != null ? aws_ecr_repository_policy.policy[0] : null
}

output "ecr_lifecycle_policy" {
  value = var.provision == true && var.max_number_of_images != null ? aws_ecr_lifecycle_policy.lifecycle_policy[0] : null
}
