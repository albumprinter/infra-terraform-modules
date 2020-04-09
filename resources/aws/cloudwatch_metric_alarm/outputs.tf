output "cloudwatch_metric_alarm" {
  value = var.provision == true && length(aws_cloudwatch_metric_alarm.alarm) > 0 ? aws_cloudwatch_metric_alarm.alarm[0] : null
}
