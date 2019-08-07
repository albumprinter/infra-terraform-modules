module "acm_certificate" {
  source = "../../modules/acm_certificate"

  domain_name = "*.sandbox.infra.albelli.com"
  hosted_zone_ids = {
    "*.sandbox.infra.albelli.com" = "Z3D9HBL9U0Q0MB"
  }

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}

module "acm_certificate_alternative_domain_names" {
  source = "../../modules/acm_certificate"

  domain_name = "*.sandbox.infra.albelli.com"
  subject_alternative_names = [
    "sandbox.infra.albelli.com",
    "tftest.sandbox.infra.albelli.com"
  ]
  hosted_zone_ids = {
    "*.sandbox.infra.albelli.com" = "Z3D9HBL9U0Q0MB",
    "sandbox.infra.albelli.com" = "Z3D9HBL9U0Q0MB",
    "tftest.sandbox.infra.albelli.com" = "Z3D9HBL9U0Q0MB",
  }

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}
