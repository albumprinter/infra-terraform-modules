# Module: Event Rule

This module provisions a CloudWatch Event Rule along with it's target.

## Examples 

#### Pattern Based
```
module "event_rule" {
  source = "../event_rule"

  event_rule_event_pattern = <<PATTERN
{
  "detail-type": [
    "AWS Console Sign In via CloudTrail"
  ]
}
PATTERN
  event_target_arn         = aws_lambda_function.function.arn

  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain      = var.tag_domain
}
```

#### Scheduled
```
module "event_rule" {
  source = "../event_rule"

  event_rule_schedule_expression = "cron(0 2 * * ? *)"
  event_target_arn               = aws_lambda_function.function.arn

  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain
}
```

#### Scheduled with an ECS Target
```
module "event_rule" {
  source = "../event_rule"

  event_rule_event_pattern = "cron(0 2 * * ? *)"
  event_target_arn         = aws_lambda_function.function.arn

  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain      = var.tag_domain

  event_target_ecs_target = [
    {
      task_count          = 1
      task_definition_arn = aws_ecs_task_definition.task_name.arn
    }
  ]
  event_target_input = <<EOF
{
  "containerOverrides": [
    {
      "name": "name-of-container-to-override",
      "command": ["bin/console", "scheduled-task"]
    }
  ]
}
EOF
}
```

## Required parameters

The following parameters are considered required.

* [event_rule_event_pattern](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#event_pattern)
  * Note: Conflicts with `event_rule_schedule_expression`
* [event_rule_schedule_expression](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_rule.html#schedule_expression)
  * Note: Conflicts with `event_rule_event_pattern`
* [event_target_arn](https://www.terraform.io/docs/providers/aws/r/cloudwatch_event_target.html#arn)

#### Tags
Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

* **tag_environment**
* **tag_cost_center**
* **tag_domain**

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

