# Module: ECS Task

This module provisions a ECS Task Definition along with the following resources:

- IAM Role for task execution with minimum permissions required
- IAM Role for containers created by the task
- CloudWatch Log Group with a default retention period of 30 days

## Examples

#### Minimal configuration

```
module "ecs_task" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/ecs_task"

  task_family                = "infra_tf_modules_example_ecs_task"
  task_container_definitions = <<EOF
    [
      {
        "name": "infra_tf_modules_example_ecs_task",
        "image": "973160909116.dkr.ecr.eu-west-1.amazonaws.com/infra_dynamodb_table_to_parquet:latest",
        "essential": true,
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "/ecs/infra_tf_modules_example_ecs_task",
            "awslogs-region": "eu-west-1",
            "awslogs-stream-prefix": "ecs"
          }
        },
        "environment": []
      }
    ]
  EOF

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }
}
```

#### Using Placement Constraints

```
module "ecs_task_placement_constraints" {
  source = "git::https://github.com/albumprinter/infra-terraform-modules.git//modules/aws/ecs_task"

  task_family                = "infra_tf_modules_example_ecs_task_placement_constraints"
  task_container_definitions = <<EOF
    [
      {
        "name": "infra_tf_modules_example_ecs_task",
        "image": "973160909116.dkr.ecr.eu-west-1.amazonaws.com/infra_dynamodb_table_to_parquet:latest",
        "essential": true,
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "/ecs/infra_tf_modules_example_ecs_task",
            "awslogs-region": "eu-west-1",
            "awslogs-stream-prefix": "ecs"
          }
        },
        "environment": []
      }
    ]
  EOF

  task_placement_constraints = [
    {
      type       = "memberOf"
      expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
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

The following parameters are considered required.

- [task_family](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#family)
- [task_container_definitions](https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#container_definitions)
- **tags**: Following the [albelli tagging standard](https://wiki.albelli.net/wiki/Albelli_AWS_Tagging_standards), the following parameters are required and will be applied to all taggable resources.

## Optional Parameters

All parameters supported by Terraform are also available for use and can be combine in any way **accepted by AWS**.

For more details, please check the [optional parameters documentation](docs/optional_parameters.md)

## Supported Patterns

This module also supports the following pattern:

- CloudWatch Rule (scheduled or event pattern) + ECS Task

To make use of this pattern, just pass one of the required parameters for the CloudWatch Rule:

- **event_rule_schedule_expression**: for scheduled CloudWatch Rules
- **event_rule_event_pattern**: for pattern based CloudWatch Rules

Along with the ECS required paramaters

- **event_target_ecs_cluster_arn**: ARN of the ECS Cluster where the task should be executed
- **event_target_network_configuration_subnets**: ID of the subnets where the task should be launched
- **event_target_network_configuration_security_groups**: ID of the security groups the task should be part of

### Example

#### Scheduled Event Rule

```
module "ecs_task" {
  source = "../../modules/ecs_task"

  task_family                = "infra_tf_modules_example_ecs_task_scheduled"
  task_container_definitions = <<EOF
    [
      {
        "name": "infra_tf_modules_example_ecs_task",
        "image": "973160909116.dkr.ecr.eu-west-1.amazonaws.com/infra_dynamodb_table_to_parquet:latest",
        "essential": true,
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "/ecs/infra_tf_modules_example_ecs_task",
            "awslogs-region": "eu-west-1",
            "awslogs-stream-prefix": "ecs"
          }
        },
        "environment": []
      }
    ]
  EOF

  tags = {
    Environment   = "..."
    Domain        = "..."
    "Cost Center" = "..."
  }

  event_rule_schedule_expression = "cron(0 2 * * ? *)"
  event_target_arn = "arn:aws:ecs:eu-west-1:123456789012:cluster/default"
  event_target_network_configuration_subnets = ["vpc-0d670e7766333aca0"]
  event_target_network_configuration_security_groups = ["sg-05c4a13b628e7c243"]
}
```

This pattern can be further customized by passing any of the parameters supported by Terraform.

For more details, please check the [patterns documentation](docs/patterns.md)

## Outputs

- **aws_ecs_task_definition**: contains all attributes available in Terraform for ECS Task Definition resources
- **cloudwatch_log_group**: contains all attributes available in Terraform for CloudWatch Log Group resources
- **task_iam_role**: contains all attributes available in Terraform for IAM Role resources
- **execution_iam_role**: contains all attributes available in Terraform for IAM Role resources
- **cloudwatch_event_rule**: contains all attributes available in Terraform for CloudWatch Event Rule resources
- **cloudwatch_event_target**: contains all attributes available in Terraform for CloudWatch Event Target resources
