module "cloudwatch_metric_alarm" {
  source = "../../../modules/aws/cloudwatch_metric_alarm"

  alarm_name          = "infra-tf-modules-examples-basic-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  threshold           = "80"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"

  tags = var.tags
}

module "cloudwatch_metric_alarm_queries" {
  source = "../../../modules/aws/cloudwatch_metric_alarm"

  alarm_name          = "infra-tf-modules-examples-query-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  threshold           = "80"

  metric_queries = [
    {
      id          = "e1"
      expression  = "m2/m1*100"
      label       = "Error Rate"
      return_data = "true"
    },
    {
      id              = "m1"
      metric_name     = "RequestCount"
      namespace       = "AWS/ApplicationELB"
      period          = "120"
      stat            = "Sum"
      unit            = "Count"
      dimension_key   = "LoadBalancer"
      dimension_value = "app/web"

    },
    {
      id              = "m2"
      metric_name     = "HTTPCode_ELB_5XX_Count"
      namespace       = "AWS/ApplicationELB"
      period          = "120"
      stat            = "Sum"
      unit            = "Count"
      dimension_key   = "LoadBalancer"
      dimension_value = "app/web"
    }
  ]

  tags = var.tags
}