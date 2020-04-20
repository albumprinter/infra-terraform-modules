resource "aws_sqs_queue" "this" {
  name          = var.name
  delay_seconds = var.delay_seconds

  tags = var.tags
}

resource "aws_lambda_event_source_mapping" "this" {
  event_source_arn = aws_sqs_queue.this.arn
  function_name    = module.lambda_function.aws_lambda_function.arn
  batch_size       = var.batch_size
}

module "lambda_function" {
  source = "../lambda_function"

  source_dir        = var.source_dir
  name              = var.name
  handler           = var.handler
  runtime           = var.runtime
  layers            = var.layers
  memory_size       = var.memory_size
  timeout           = var.timeout
  environment       = var.environment
  vpc_config        = var.vpc_config
  retention_in_days = var.retention_in_days
  policy_statements = concat(var.policy_statements,
    [
      {
        "Effect" : "Allow",
        "Action" : [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ],
        "Resource" : [
          aws_sqs_queue.this.arn
        ]
      }
    ]
  )
  tags = var.tags
}
