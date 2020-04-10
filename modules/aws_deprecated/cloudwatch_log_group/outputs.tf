output "cloudwatch_log_group" {
  value = var.provision == true ? aws_cloudwatch_log_group.log_group[0] : null
}