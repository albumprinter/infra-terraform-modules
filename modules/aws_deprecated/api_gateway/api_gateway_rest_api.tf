resource "aws_api_gateway_rest_api" "api" {
  count = var.provision == true ? 1 : 0

  # Required
  name = var.api_gateway_rest_api_name

  # Optional
  description = var.api_gateway_rest_api_description
  dynamic "endpoint_configuration" {
    for_each = [for configuration in var.api_gateway_rest_api_endpoint_configuration : {
      types = configuration.types
    }]

    content {
      types = endpoint_configuration.value.types
    }
  }
  binary_media_types       = var.api_gateway_rest_api_binary_media_types
  minimum_compression_size = var.api_gateway_rest_api_minimum_compression_size
  body                     = var.api_gateway_rest_api_body
  policy                   = var.api_gateway_rest_api_policy
  api_key_source           = var.api_gateway_rest_api_api_key_source
}


# -------------------- Variables --------------------

variable "api_gateway_rest_api_name" {
  default = null
}
variable "api_gateway_rest_api_description" {
  default = null
}
variable "api_gateway_rest_api_endpoint_configuration" {
  type    = list
  default = []
}
variable "api_gateway_rest_api_binary_media_types" {
  default = null
}
variable "api_gateway_rest_api_minimum_compression_size" {
  default = null
}
variable "api_gateway_rest_api_body" {
  default = null
}
variable "api_gateway_rest_api_policy" {
  default = null
}
variable "api_gateway_rest_api_api_key_source" {
  default = null
}