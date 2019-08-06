output "resource" {
  value = var.provision == true ? aws_api_gateway_api_key.key : ()
}