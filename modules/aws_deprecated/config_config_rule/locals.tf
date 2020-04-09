locals {
  custom_rule_function_name    = var.custom_rule_function_name != null ? var.custom_rule_function_name : var.config_rule_name
  custom_rule_function_runtime = var.custom_rule_function_runtime != null ? var.custom_rule_function_runtime : "python3.7"
  config_rule_source_detail    = var.config_rule_owner == "CUSTOM_LAMBDA" && length(var.config_rule_source_detail) == 0 ? [{}] : var.config_rule_source_detail
}
