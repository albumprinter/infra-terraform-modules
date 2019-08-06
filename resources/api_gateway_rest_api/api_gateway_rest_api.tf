resource "aws_api_gateway_rest_api" "api" {
  count = var.provision == true ? 1 : 0
  
  # Required
  name = var.name 

  # Optional
  description = var.description 
  dynamic "endpoint_configuration" {
    for_each = [for configuration in var.endpoint_configuration: {
      types = configuration.types
    }]

    content {
      types = endpoint_configuration.value.types     
    }
  }
  binary_media_types = var.binary_media_types
  minimum_compression_size = var.minimum_compression_size
  body = var.body
  policy = var.policy
  api_key_source = var.api_key_source
}