# Module: CloudWatch Metric Alarm

This module provisions a CloudWatch Metric Alarm.

## Examples

#### Minimal configuration

```
module "basic_cw_alarm" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/cloudwatch_metric_alarm"

  alarm_name          = "infra-tf-modules-examples-basic-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  threshold           = "80"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

#### Using metric queries

```
module "query_cw_alarm" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/cloudwatch_metric_alarm"

  alarm_name          = "infra-tf-modules-examples-basic-alarm"
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

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

## Required parameters

- [**alarm_name**](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#alarm_name)
- [**comparison_operator**](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#comparison_operator)
- [**evaluation_periods**](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#evaluation_periods)
- [**threshold**](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#threshold)
- **tags**: Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

In case `metric_queries` are not specified, the following parameters are also required in order to avoid errors:

- [**metric_name**](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#metric_name)
- [**namespace**](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#namespace)
- [**period**](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#period)
- [**statistic**](https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html#statistic)

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Outputs

- **cloudwatch_metric_alarm**: contains all attributes available in Terraform for CloudWatch Metric Alarm resources
