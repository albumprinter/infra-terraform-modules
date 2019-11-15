output "cloudwatch_metric_alarm" {
  value = var.provision == true ? aws_cloudwatch_metric_alarm.alarm[0] : null
}
