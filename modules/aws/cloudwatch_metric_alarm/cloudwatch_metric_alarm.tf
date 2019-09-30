resource "aws_cloudwatch_metric_alarm" "alarm" {
  # Required
  alarm_name          = var.alarm_name
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  threshold           = var.threshold
  tags = merge(var.tags, {
    Name = var.alarm_name
  })

  # Optional
  actions_enabled                       = var.actions_enabled
  alarm_actions                         = var.alarm_actions
  alarm_description                     = var.alarm_description
  datapoints_to_alarm                   = var.datapoints_to_alarm
  insufficient_data_actions             = var.insufficient_data_actions
  ok_actions                            = var.ok_actions
  unit                                  = var.unit
  extended_statistic                    = var.extended_statistic
  treat_missing_data                    = var.treat_missing_data
  evaluate_low_sample_count_percentiles = var.evaluate_low_sample_count_percentiles
  dimensions                            = var.dimensions

  dynamic "metric_query" {
    for_each = [for query in var.metric_queries : {
      id          = query.id
      expression  = lookup(query, "expression", null)
      label       = lookup(query, "label", null)
      return_data = lookup(query, "return_data", null)
      metric = lookup(query, "metric_name", null) == null ? [] : [
        {
          metric_name = query.metric_name
          namespace   = query.namespace
          period      = query.period
          stat        = query.stat
          unit        = lookup(query, "unit", null)
          dimensions = {
            lookup(query, "dimension_key", null) = lookup(query, "dimension_value", null)
          }
        }
      ]
    }]

    content {
      id          = metric_query.value.id
      expression  = metric_query.value.expression
      label       = metric_query.value.label
      return_data = metric_query.value.return_data

      dynamic "metric" {
        for_each = metric_query.value.metric

        content {
          metric_name = metric.value.metric_name
          namespace   = metric.value.namespace
          period      = metric.value.period
          stat        = metric.value.stat
          unit        = metric.value.unit
          dimensions  = metric.value.dimensions
        }
      }
    }
  }
}

# -------------------- Variables --------------------
variable "alarm_name" {}
variable "comparison_operator" {}
variable "evaluation_periods" {}
variable "threshold" {}
variable "metric_name" {
  default = null
}
variable "namespace" {
  default = null
}
variable "period" {
  default = null
}
variable "statistic" {
  default = null
}
variable "actions_enabled" {
  default = null
}
variable "alarm_actions" {
  default = null
}
variable "alarm_description" {
  default = null
}
variable "datapoints_to_alarm" {
  default = null
}
variable "insufficient_data_actions" {
  default = null
}
variable "ok_actions" {
  default = null
}
variable "unit" {
  default = null
}
variable "extended_statistic" {
  default = null
}
variable "treat_missing_data" {
  default = null
}
variable "evaluate_low_sample_count_percentiles" {
  default = null
}
variable "dimensions" {
  default = null
}
variable "metric_queries" {
  type    = "list"
  default = []
}