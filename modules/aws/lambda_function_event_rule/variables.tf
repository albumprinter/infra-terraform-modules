variable "name" {
  description = "Name that should be used for the Lambda function and related resources"
}
variable "source_dir" {
  description = "Local directory containing the source code for the Lambda Function"
}

variable "handler" {
  description = "The entrypoint that should be called when the Lambda function is invoked"
  default     = "lambda_function.lambda_handler"
}
variable "runtime" {
  description = "Runtime that should be used for the Lambda function"
  default     = "python3.7"
}
variable "layers" {
  description = "List of Lambda layers that should be attached to the Lambda function"
  type        = list
  default     = null
}
variable "memory_size" {
  description = "Amount of memory that should be configured for the Lambda function"
  default     = null
}
variable "timeout" {
  description = "Timeout for the Lambda function"
  default     = null
}
variable "environment" {
  description = "Environment configuration for the Lambda function"
  type        = map
  default     = null
}
variable "vpc_config" {
  description = "VPC Config for the Lambda function"
  type        = map
  default     = null
}
variable "tags" {
  description = "Tags that should be applied to all resources in this module"
}
variable "retention_in_days" {
  description = "Retention period for log messages in days"
  default     = 30
}
variable "policy_statements" {
  description = "IAM Policy Statements that should be applied to the Lambda function"
  default     = []
}
variable "is_enabled" {
  description = "Whether the CloudWatch Event Rule should be enabled or not"
  default     = true
}
variable "event_pattern" {
  description = "Event pattern that should be used to trigger the CloudWatch Event Rule"
  default     = null
}
variable "schedule_expression" {
  description = "Scheduled expression that should be used to trigger the CloudWatch Event Rule"
  default     = null
}