resource "aws_api_gateway_resource" "resource" {
  count = var.provision == true && var.api_gateway_resource_path_part != null ? 1 : 0

  # Required  
  path_part = var.api_gateway_resource_path_part

  # Internally handled
  rest_api_id = aws_api_gateway_rest_api.api[0].id
  parent_id   = aws_api_gateway_rest_api.api[0].root_resource_id
}

# -------------------- Variables --------------------

variable "api_gateway_resource_path_part" {
  default = null
}
