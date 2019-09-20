resource "aws_cloudwatch_log_group" "log_group" {
  count = var.provision == true ? 1 : 0

  # Required
  tags = local.tags

  # Optional
  name              = var.name
  name_prefix       = var.name_prefix
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id
}

# -------------------- Variables --------------------

variable "name" {
  default = null
}
variable "name_prefix" {
  default = null
}
variable "retention_in_days" {
  default = null
}
variable "kms_key_id" {
  default = null
}
variable "tag_others" {
  default = {}
}