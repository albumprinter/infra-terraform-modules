resource "aws_acm_certificate" "certificate" {
  domain_name = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method = var.validation_method
  private_key = var.private_key
  certificate_body = var.certificate_body
  certificate_chain = var.certificate_chain
  tags = var.tags
}