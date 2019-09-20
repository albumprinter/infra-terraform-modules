module "hosted_zone" {
  source = "../../modules/route53_hosted_zone"

  zone_name = "infra.tf.modules.examples.test"
  records = [
    {
      name    = "infra.modules.test"
      type    = "A"
      ttl     = "300"
      records = ["127.0.0.1"]
    }
  ]

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}

module "hosted_zone_no_records" {
  source = "../../modules/route53_hosted_zone"

  zone_name = "infra.tf.modules.examples.norecords.test"

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}