resource "aws_lambda_function" "function" {
  count = var.provision == true ? 1 : 0

  # Required
  function_name = var.function_name
  handler       = local.function_handler
  role          = module.role.iam_role.arn
  runtime       = var.function_runtime
  filename      = var.function_filename
  s3_bucket     = local.function_s3_bucket
  s3_key        = local.function_s3_key

  # Internally handled
  dead_letter_config {
    target_arn = var.function_dead_letter_target_type == "SQS" ? module.dead_letter_queue.sqs_queue.arn : module.dead_letter_topic.sns_topic.arn
  }

  #Optional
  dynamic "environment" {
    for_each = var.function_environment

    content {
      variables = environment.value.variables
    }
  }

  s3_object_version              = var.function_s3_object_version
  description                    = var.function_description
  kms_key_arn                    = var.function_kms_key_arn
  layers                         = var.function_layers
  memory_size                    = var.function_memory_size
  publish                        = var.function_publish
  reserved_concurrent_executions = var.function_reserved_concurrent_executions
  source_code_hash               = var.function_source_code_hash
  tags = merge(var.tags, {
    Name = var.function_name
  })
  timeout = var.function_timeout

  dynamic "vpc_config" {
    for_each = var.function_vpc_config

    content {
      subnet_ids         = vpc_config.value.subnet_ids
      security_group_ids = vpc_config.value.security_group_ids
    }
  }
}

# ----------------------- Variables -----------------------

variable "function_name" {}

variable "function_runtime" {}

variable "function_handler" {
  default = null
}

variable "function_filename" {
  default = null
}

variable "function_s3_bucket" {
  default = null
}

variable "function_s3_key" {
  default = null
}

variable "function_s3_object_version" {
  default = null
}

variable "function_environment" {
  type    = list
  default = []
}

variable "function_description" {
  default = null
}

variable "function_kms_key_arn" {
  default = null
}

variable "function_layers" {
  default = null
}

variable "function_memory_size" {
  default = null
}

variable "function_publish" {
  default = null
}

variable "function_reserved_concurrent_executions" {
  default = null
}

variable "function_source_code_hash" {
  default = null
}

variable "function_timeout" {
  default = 60
}

variable "function_vpc_config" {
  type    = list
  default = []
}

variable "function_dead_letter_target_type" {
  default = "SQS"
}

variable "function_dead_letter_target_name" {
  default = null
}
