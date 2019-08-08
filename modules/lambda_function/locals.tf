locals {
  tags = merge({
    Domain        = var.tag_domain
    Enviroment    = var.tag_environment
    "Cost Center" = var.tag_cost_center
  }, var.tag_others)

  function_dead_letter_target_name = var.function_dead_letter_target_name != null ? var.function_dead_letter_target_name : "${var.function_name}_dead_letter"
}
