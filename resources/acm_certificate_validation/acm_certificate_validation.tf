resource "aws_acm_certificate_validation" "validation" {
  count = var.provision == true ? 1 : 0

  certificate_arn = var.certificate_arn
  validation_record_fqdns = var.validation_record_fqdns
}