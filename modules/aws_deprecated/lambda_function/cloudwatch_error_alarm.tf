module "error_alarm" {
  source    = "../../../modules/aws/cloudwatch_metric_alarm"
  provision = var.provision == true ? true : false

  # Required  
  period              = var.cloudwatch_error_alarm_period
  statistic           = var.cloudwatch_error_alarm_statistic
  comparison_operator = var.cloudwatch_error_alarm_comparison_operator
  evaluation_periods  = var.cloudwatch_error_alarm_evaluation_periods
  threshold           = var.cloudwatch_error_alarm_threshold
  tags                = var.tags

  # Internally handled
  metric_name = "Errors"
  namespace   = "AWS/Lambda"
  alarm_name  = "${length(aws_lambda_function.function) > 0 ? aws_lambda_function.function[0].function_name : ""}-errors"

  dimensions = {
    FunctionName = length(aws_lambda_function.function) > 0 ? aws_lambda_function.function[0].function_name : null
  }


  # Optional
  actions_enabled                       = var.cloudwatch_error_alarm_actions_enabled
  alarm_actions                         = var.cloudwatch_error_alarm_alarm_actions
  alarm_description                     = var.cloudwatch_error_alarm_alarm_description
  datapoints_to_alarm                   = var.cloudwatch_error_alarm_datapoints_to_alarm
  insufficient_data_actions             = var.cloudwatch_error_alarm_insufficient_data_actions
  ok_actions                            = var.cloudwatch_error_alarm_ok_actions
  unit                                  = var.cloudwatch_error_alarm_unit
  extended_statistic                    = var.cloudwatch_error_alarm_extended_statistic
  treat_missing_data                    = var.cloudwatch_error_alarm_treat_missing_data
  evaluate_low_sample_count_percentiles = var.cloudwatch_error_alarm_evaluate_low_sample_count_percentiles
}

# ----------------------- Variables -----------------------

variable "cloudwatch_error_alarm_comparison_operator" {
  default = "GreaterThanThreshold"
}
variable "cloudwatch_error_alarm_evaluation_periods" {
  default = "1"
}
variable "cloudwatch_error_alarm_threshold" {
  default = "0"
}
variable "cloudwatch_error_alarm_period" {
  default = "60"
}
variable "cloudwatch_error_alarm_statistic" {
  default = "Maximum"
}
variable "cloudwatch_error_alarm_actions_enabled" {
  default = null
}
variable "cloudwatch_error_alarm_alarm_actions" {
  default = null
}
variable "cloudwatch_error_alarm_alarm_description" {
  default = null
}
variable "cloudwatch_error_alarm_datapoints_to_alarm" {
  default = null
}
variable "cloudwatch_error_alarm_insufficient_data_actions" {
  default = null
}
variable "cloudwatch_error_alarm_ok_actions" {
  default = null
}
variable "cloudwatch_error_alarm_unit" {
  default = null
}
variable "cloudwatch_error_alarm_extended_statistic" {
  default = null
}
variable "cloudwatch_error_alarm_treat_missing_data" {
  default = null
}
variable "cloudwatch_error_alarm_evaluate_low_sample_count_percentiles" {
  default = null
}