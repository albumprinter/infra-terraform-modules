module "ecs_task" {
  source = "../../../modules/aws/ecs_task"

  task_family                = "infra-tf-modules-examples-ecs-task"
  task_container_definitions = <<EOF
    [
      {
        "name": "infra-tf-modules-examples-ecs-task",
        "image": "973160909116.dkr.ecr.eu-west-1.amazonaws.com/infra_dynamodb_table_to_parquet:latest",
        "essential": true,
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "/ecs/infra-tf-modules-examples-ecs-task",
            "awslogs-region": "eu-west-1",
            "awslogs-stream-prefix": "ecs"
          }
        },
        "environment": []
      }
    ]
  EOF

  tags = var.tags
}

module "ecs_task_extra_execution_permissions" {
  source = "../../../modules/aws/ecs_task"

  task_family                = "infra-tf-modules-examples-ecs-task"
  task_container_definitions = <<EOF
    [
      {
        "name": "infra-tf-modules-examples-ecs-task",
        "image": "973160909116.dkr.ecr.eu-west-1.amazonaws.com/infra_dynamodb_table_to_parquet:latest",
        "essential": true,
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "/ecs/infra-tf-modules-examples-ecs-task",
            "awslogs-region": "eu-west-1",
            "awslogs-stream-prefix": "ecs"
          }
        },
        "environment": []
      }
    ]
  EOF

  execution_role_policy_statements = [
    {
      "Effect": "Allow",
      "Action": [ "ssm:GetParameters" ],
      "Resource": [
        aws_ssm_parameter.test_parameter.arn
      ]
    }
  ]

  tags = var.tags
}

module "ecs_task_placement_constraints" {
  source = "../../../modules/aws/ecs_task"

  task_family                = "infra-tf-modules-examples-ecs-task-placement-constraints"
  task_container_definitions = <<EOF
    [
      {
        "name": "infra-tf-modules-examples-ecs-task-placement-constraints",
        "image": "973160909116.dkr.ecr.eu-west-1.amazonaws.com/infra_dynamodb_table_to_parquet:latest",
        "essential": true,
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "/ecs/infra-tf-modules-examples-ecs-task-placement-constraints",
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

  tags = var.tags
}

module "ecs_task_scheduled" {
  source = "../../../modules/aws/ecs_task"

  task_family                = "infra-tf-modules-examples-ecs-task-scheduled"
  task_container_definitions = <<EOF
    [
      {
        "name": "infra-tf-modules-examples-ecs-task-scheduled",
        "image": "973160909116.dkr.ecr.eu-west-1.amazonaws.com/infra_dynamodb_table_to_parquet:latest",
        "essential": true,
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "/ecs/infra-tf-modules-examples-ecs-task-scheduled",
            "awslogs-region": "eu-west-1",
            "awslogs-stream-prefix": "ecs"
          }
        },
        "environment": []
      }
    ]
  EOF

  tags = var.tags

  event_rule_schedule_expression                     = "cron(0 2 * * ? *)"
  event_target_arn                                   = aws_ecs_cluster.example.arn
  event_target_network_configuration_subnets         = data.aws_subnet_ids.private.ids
  event_target_network_configuration_security_groups = [module.security_group.security_group.id]
}
