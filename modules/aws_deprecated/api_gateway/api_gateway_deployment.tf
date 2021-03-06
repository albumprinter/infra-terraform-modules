resource "aws_api_gateway_deployment" "deployment" {
  count = var.provision == true && var.api_gateway_integration_type != null && var.api_gateway_deployment_stage_name != null ? 1 : 0

  # Required
  stage_name = var.api_gateway_deployment_stage_name

  # Internally handled
  rest_api_id = aws_api_gateway_rest_api.api[0].id

  # Optional
  description       = var.api_gateway_deployment_description
  stage_description = var.api_gateway_deployment_stage_description
  variables         = var.api_gateway_deployment_variables

  depends_on = [
    aws_api_gateway_integration.integration
  ]
}

# -------------------- Variables --------------------

variable "api_gateway_deployment_stage_name" {
  default = null
}
variable "api_gateway_deployment_description" {
  default = ""
}
variable "api_gateway_deployment_stage_description" {
  default = null
}
variable "api_gateway_deployment_variables" {
  type    = map
  default = null
}