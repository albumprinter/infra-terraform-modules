output "cloudwatch_log_group" {
  value = module.log_group.cloudwatch_log_group
}
output "codebuild_project" {
  value = aws_codebuild_project.project
}
output "iam_role" {
  value = module.iam_role.iam_role
}