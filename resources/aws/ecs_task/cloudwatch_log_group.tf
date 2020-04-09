module "log_group" {
  source = "../cloudwatch_log_group"

  # Required
  tags = var.tags

  # Optional
  name              = var.log_group_name != null ? var.log_group_name : "/ecs/${var.task_family}"
  retention_in_days = var.log_group_retention_in_days
  kms_key_id        = var.log_group_kms_key_id
}

# -------------------- Variables --------------------

variable "log_group_name" {
  default = null
}
variable "log_group_retention_in_days" {
  default = 30
}
variable "log_group_kms_key_id" {
  default = null
}