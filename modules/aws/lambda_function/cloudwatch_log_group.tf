module "log_group" {
  source    = "../cloudwatch_log_group"
  provision = var.provision == true ? true : false

  # Required
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain      = var.tag_domain

  # Optional
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.log_group_retention_in_days
  kms_key_id        = var.log_group_kms_key_id

  tag_others = var.tag_others
}

# ----------------------- Variables -----------------------

variable "log_group_retention_in_days" {
  default = 30
}
variable "log_group_kms_key_id" {
  default = null
}