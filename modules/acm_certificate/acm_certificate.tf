resource "aws_acm_certificate" "certificate" {
  domain_name = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method = var.validation_method
  private_key = var.private_key
  certificate_body = var.certificate_body
  certificate_chain = var.certificate_chain
  tags = local.tags
}

resource "aws_route53_record" "validation_record" {
  count = var.validation_method == "DNS" ? length(var.hosted_zone_ids) : 0

  name    = aws_acm_certificate.certificate.domain_validation_options[count.index].resource_record_name
  type    = aws_acm_certificate.certificate.domain_validation_options[count.index].resource_record_type
  zone_id = lookup(var.hosted_zone_ids, aws_acm_certificate.certificate.domain_validation_options[count.index].domain_name)
  records = [aws_acm_certificate.certificate.domain_validation_options[count.index].resource_record_value]
  ttl     = 60
  allow_overwrite = true
}

resource "aws_acm_certificate_validation" "validation" {
  count = var.validation_method == "DNS" ? 1 : 0

  certificate_arn = aws_acm_certificate.certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.validation_record:
    record.fqdn
  ]
}
