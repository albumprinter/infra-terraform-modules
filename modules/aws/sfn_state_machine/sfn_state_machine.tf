resource "aws_sfn_state_machine" "state_machine" {
  # Required
  name       = var.sfn_state_machine_name
  definition = var.sfn_state_machine_definition
  role_arn   = module.iam_role.iam_role.arn
  tags       = local.tags
}

# -------------------- Variables --------------------
variable "sfn_state_machine_name" {}
variable "sfn_state_machine_definition" {}