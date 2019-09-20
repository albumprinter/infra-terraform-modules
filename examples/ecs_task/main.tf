module "ecs_task" {
  source = "../../modules/ecs_task"

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

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}

module "ecs_task_placement_constraints" {
  source = "../../modules/ecs_task"

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

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}

module "ecs_task_scheduled" {
  source = "../../modules/ecs_task"

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

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain

  event_rule_schedule_expression                     = "cron(0 2 * * ? *)"
  event_target_arn                                   = aws_ecs_cluster.example.arn
  event_target_network_configuration_subnets         = data.aws_subnet_ids.private.ids
  event_target_network_configuration_security_groups = [module.security_group.security_group.id]
}
