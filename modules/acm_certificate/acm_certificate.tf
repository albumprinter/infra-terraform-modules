module "certificate" {
  source = "../../resources/acm_certificate"

  domain_name = var.domain_name
  validation_method = var.validation_method  
  subject_alternative_names = var.subject_alternative_names
  private_key = var.private_key
  certificate_body = var.certificate_body
  certificate_chain = var.certificate_chain
  tags = local.tags
}

resource "aws_route53_record" "validation_record" {
  count = var.validation_method == "DNS" ? length(var.hosted_zone_ids) : 0

  name    = module.certificate.resource.domain_validation_options[count.index].resource_record_name
  type    = module.certificate.resource.domain_validation_options[count.index].resource_record_type
  zone_id = lookup(var.hosted_zone_ids, module.certificate.resource.domain_validation_options[count.index].domain_name)
  records = [module.certificate.resource.domain_validation_options[count.index].resource_record_value]
  ttl     = 60
  allow_overwrite = true
}

module "validation" {
  source = "../../resources/acm_certificate_validation"
  provision = var.validation_method == "DNS" ? true : false

  certificate_arn = module.certificate.resource.arn
  validation_record_fqdns = [for record in aws_route53_record.validation_record:
    record.fqdn
  ]
}


/*module "validation_records" {
  source = "../../resources/route53_record"
  
  records = [for record in module.certificate.resource.domain_validation_options:{
    name    = record.resource_record_name
    type    = record.resource_record_type
    zone_id = lookup(var.hosted_zone_ids, record.domain_name)
    records = [record.resource_record_value]
    ttl     = 60
    allow_overwrite = true
  }]
}*/