module "custom_rule" {
  source    = "../lambda_function"
  provision = var.config_rule_owner == "CUSTOM_LAMBDA" ? true : false

  # Required
  function_name    = local.custom_rule_function_name
  function_runtime = local.custom_rule_function_runtime
  tags             = var.tags

  # Optional
  function_handler                        = var.custom_rule_function_handler
  function_filename                       = var.custom_rule_function_filename
  function_s3_bucket                      = var.custom_rule_function_s3_bucket
  function_s3_key                         = var.custom_rule_function_s3_key
  function_s3_object_version              = var.custom_rule_function_s3_object_version
  function_environment                    = var.custom_rule_function_environment
  function_description                    = var.custom_rule_function_description
  function_kms_key_arn                    = var.custom_rule_function_kms_key_arn
  function_layers                         = var.custom_rule_function_layers
  function_memory_size                    = var.custom_rule_function_memory_size
  function_publish                        = var.custom_rule_function_publish
  function_reserved_concurrent_executions = var.custom_rule_function_reserved_concurrent_executions
  function_source_code_hash               = var.custom_rule_function_source_code_hash
  function_timeout                        = var.custom_rule_function_timeout
  function_vpc_config                     = var.custom_rule_function_vpc_config
  function_dead_letter_target_type        = var.custom_rule_function_dead_letter_target_type
  function_dead_letter_target_name        = var.custom_rule_function_dead_letter_target_name

  # Optional
  iam_role_policy_statements     = var.custom_rule_iam_role_policy_statements
  iam_role_description           = var.custom_rule_iam_role_description
  iam_role_force_detach_policies = var.custom_rule_iam_role_force_detach_policies
  iam_role_max_session_duration  = var.custom_rule_iam_role_max_session_duration
  iam_role_name                  = var.custom_rule_iam_role_name
  iam_role_name_prefix           = var.custom_rule_iam_role_name_prefix
  iam_role_path                  = var.custom_rule_iam_role_path
  iam_role_permissions_boundary  = var.custom_rule_iam_role_permissions_boundary
  iam_role_policy_description    = var.custom_rule_iam_role_policy_description
  iam_role_policy_name           = var.custom_rule_iam_role_policy_name
  iam_role_policy_name_prefix    = var.custom_rule_iam_role_policy_name_prefix
  iam_role_policy_path           = var.custom_rule_iam_role_policy_path
}

resource "aws_lambda_permission" "custom_rule" {
  count = var.config_rule_owner == "CUSTOM_LAMBDA" ? 1 : 0

  action        = "lambda:InvokeFunction"
  function_name = module.custom_rule.lambda_function.arn
  principal     = "config.amazonaws.com"
  statement_id  = "AllowExecutionFromConfig"
}

resource "aws_iam_role_policy_attachment" "config_policy" {
  count = var.config_rule_owner == "CUSTOM_LAMBDA" ? 1 : 0

  role       = module.custom_rule.iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRulesExecutionRole"
}

# -------------------- Variables --------------------
# Lambda Function
variable "custom_rule_function_name" {
  default = null
}

variable "custom_rule_function_runtime" {
  default = null
}

variable "custom_rule_function_handler" {
  default = null
}

variable "custom_rule_function_filename" {
  default = null
}

variable "custom_rule_function_s3_bucket" {
  default = null
}

variable "custom_rule_function_s3_key" {
  default = null
}

variable "custom_rule_function_s3_object_version" {
  default = null
}

variable "custom_rule_function_environment" {
  type    = "list"
  default = []
}

variable "custom_rule_function_description" {
  default = null
}

variable "custom_rule_function_kms_key_arn" {
  default = null
}

variable "custom_rule_function_layers" {
  default = null
}

variable "custom_rule_function_memory_size" {
  default = null
}

variable "custom_rule_function_publish" {
  default = null
}

variable "custom_rule_function_reserved_concurrent_executions" {
  default = null
}

variable "custom_rule_function_source_code_hash" {
  default = null
}

variable "custom_rule_function_timeout" {
  default = null
}

variable "custom_rule_function_vpc_config" {
  type    = "list"
  default = []
}

variable "custom_rule_function_dead_letter_target_type" {
  default = "SQS"
}

variable "custom_rule_function_dead_letter_target_name" {
  default = null
}

# IAM Role
variable "custom_rule_iam_role_policy_statements" {
  default = []
}
variable "custom_rule_iam_role_description" {
  default = null
}

variable "custom_rule_iam_role_force_detach_policies" {
  default = null
}

variable "custom_rule_iam_role_max_session_duration" {
  default = null
}

variable "custom_rule_iam_role_name" {
  default = null
}

variable "custom_rule_iam_role_name_prefix" {
  default = null
}

variable "custom_rule_iam_role_path" {
  default = null
}

variable "custom_rule_iam_role_permissions_boundary" {
  default = null
}

variable "custom_rule_iam_role_policy_description" {
  default = null
}

variable "custom_rule_iam_role_policy_name" {
  default = null
}

variable "custom_rule_iam_role_policy_name_prefix" {
  default = null
}

variable "custom_rule_iam_role_policy_path" {
  default = null
}