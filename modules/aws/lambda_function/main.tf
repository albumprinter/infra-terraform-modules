data "archive_file" "this" {
  type        = "zip"
  source_dir  = var.source_dir
  output_path = local.output_path
}

resource "aws_lambda_function" "this" {
  function_name    = var.name
  handler          = var.handler
  role             = module.iam_role.aws_iam_role.arn
  runtime          = var.runtime
  layers           = var.layers
  memory_size      = var.memory_size
  filename         = data.archive_file.this.output_path
  source_code_hash = data.archive_file.this.output_base64sha256
  timeout          = var.timeout

  dynamic "environment" {
    for_each = local.environment

    content {
      variables = environment.value.variables
    }
  }

  dynamic "vpc_config" {
    for_each = local.vpc_config

    content {
      subnet_ids         = vpc_config.value.subnet_ids
      security_group_ids = vpc_config.value.security_group_ids
    }
  }

  tags = var.tags

  depends_on = [
    aws_cloudwatch_log_group.this
  ]
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/lambda/${var.name}"
  retention_in_days = var.retention_in_days
  tags              = var.tags
}

module "iam_role" {
  source = "../iam_role_with_policy"

  name               = var.name
  assume_role_policy = templatefile("${path.module}/templates/assume_role_policy.json", {})
  policy = templatefile("${path.module}/templates/policy.tpl", {
    policy_statements = concat(var.policy_statements, length(local.vpc_config) == 0 ? [] : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface"
        ],
        "Resource" : ["*"]
      }
    ])
  })

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "errors" {
  alarm_name                = "${var.name}Errors"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "1"
  metric_name               = "Errors"
  namespace                 = "AWS/Lambda"
  period                    = "60"
  statistic                 = "Maximum"
  threshold                 = "0"
  alarm_description         = "Monitors errors in Lambda Function ${var.name}"
  actions_enabled           = var.error_actions_enabled
  insufficient_data_actions = var.error_insufficient_data_actions
  alarm_actions             = var.error_alarm_actions
  ok_actions                = var.error_ok_actions
  dimensions = {
    FunctionName = var.name
  }
}
