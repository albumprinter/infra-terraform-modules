resource "aws_lambda_function" "function" {
  # Required
  function_name = var.function_name
  handler       = var.function_handler
  role          = module.role.role.arn
  runtime       = var.function_runtime

  # Conditionally Required
  filename          = var.function_filename
  s3_bucket         = var.function_s3_bucket
  s3_key            = var.function_s3_key
  s3_object_version = var.function_s3_object_version

  #Optional
  dynamic "environment" {
    for_each = var.function_environment

    content {
      variables = environment.value.variables
    }
  }

  dead_letter_config {
    target_arn = var.function_dead_letter_target_type == "SQS" ? module.dead_letter_queue.queue.arn : module.dead_letter_topic.topic.arn
  }

  description                    = var.function_description
  kms_key_arn                    = var.function_kms_key_arn
  layers                         = var.function_layers
  memory_size                    = var.function_memory_size
  publish                        = var.function_publish
  reserved_concurrent_executions = var.function_reserved_concurrent_executions
  source_code_hash               = var.function_source_code_hash
  tags                           = local.tags
  timeout                        = var.function_timeout
  
  dynamic "vpc_config" {
    for_each = var.function_vpc_config

    content {
      subnet_ids    = vpc_config.value.subnet_ids
      security_group_ids = vpc_config.value.security_group_ids
    }
  }
}

module "role" {
  source = "../iam_role"

  # Required  
  assume_role_principal = "lambda.amazonaws.com"
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain

  # Optional
  policy_statements = concat(var.iam_role_policy_statements, [
    {
      "Effect" : "Allow",
      "Action" : [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource" : ["arn:aws:logs:*:*:*"]
    },
    {
      "Effect" : "Allow",
      "Action" : [
        "${var.function_dead_letter_target_type == "SQS" ? "sqs:SendMessage" : "sns:Publish"}"
      ],
      "Resource" : ["arn:aws:${var.function_dead_letter_target_type == "SQS" ? "sqs" : "sns"}:eu-west-1:*:${local.function_dead_letter_target_name}"]
    }
    ],
    length(var.function_vpc_config) == 0 ? [] : [
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
  role_description           = var.iam_role_description
  role_force_detach_policies = var.iam_role_force_detach_policies
  role_max_session_duration  = var.iam_role_max_session_duration
  role_name                  = var.iam_role_name != null ? var.iam_role_name : var.function_name
  role_name_prefix           = var.iam_role_name_prefix
  role_path                  = var.iam_role_path
  role_permissions_boundary  = var.iam_role_permissions_boundary
  policy_description         = var.iam_role_policy_description
  policy_name                = var.iam_role_policy_name != null ? var.iam_role_policy_name : var.function_name
  policy_name_prefix         = var.iam_role_policy_name_prefix
  policy_path                = var.iam_role_policy_path
  tag_others                 = var.tag_others
}

module "log_group" {
  source = "../cloudwatch_log_group"

  # Required
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain = var.tag_domain

  # Optional
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.log_group_retention_in_days
  kms_key_id        = var.log_group_kms_key_id
  tag_others        = var.tag_others
}
