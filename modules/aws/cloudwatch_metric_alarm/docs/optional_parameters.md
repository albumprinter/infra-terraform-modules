# Module: CloudWatch Metric Alarm - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

#### CloudWatch Metric Alarm

- [actions_enabled](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#actions_enabled)
- [alarm_actions](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#alarm_actions)
- [alarm_description](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#alarm_description)
- [datapoints_to_alarm](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#datapoints_to_alarm)
- [insufficient_data_actions](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#insufficient_data_actions)
- [ok_actions](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#ok_actions)
- [unit](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#unit)
- [extended_statistic](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#extended_statistic)
- [treat_missing_data](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#treat_missing_data)
- [evaluate_low_sample_count_percentiles](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#evaluate_low_sample_count_percentiles)
- [dimensions](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#dimensions)
- [metric_queries](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#metric_query)
  - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    - [id](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#id)
    - [expression](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#expression)
    - [label](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#label)
    - [return_data](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#return_data)
    - [metric_name](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#metric_name-1)
    - [namespace](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#namespace-1)
    - [period](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#period-1)
    - [stat](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#stat)
    - [unit](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#unit-1)
    - [dimension_key](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#dimensions-1)
    - [dimension_value](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#dimensions-1)
  - Example:

```
metric_queries = [
    {
      id          = "e1"
      expression  = "m2/m1*100"
      label       = "Error Rate"
      return_data = "true"
    },
    {
      id = "m1"
      metric_name     = "RequestCount"
      namespace       = "AWS/ApplicationELB"
      period          = "120"
      stat            = "Sum"
      unit            = "Count"
      dimension_key   = "LoadBalancer"
      dimension_value = "app/web"

    },
    {
      id = "m2"
      metric_name = "HTTPCode_ELB_5XX_Count"
      namespace   = "AWS/ApplicationELB"
      period      = "120"
      stat        = "Sum"
      unit        = "Count"
      dimension_key   = "LoadBalancer"
      dimension_value = "app/web"
    }
  ]
```
