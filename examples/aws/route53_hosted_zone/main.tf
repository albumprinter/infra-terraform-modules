module "hosted_zone" {
  source = "../../../modules/aws/route53_hosted_zone"

  zone_name = "infra.tf.modules.examples.test"
  records = [
    {
      name    = "infra.modules.test"
      type    = "A"
      ttl     = "300"
      records = ["127.0.0.1"]
    }
  ]

  tags = var.tags
}

module "hosted_zone_no_records" {
  source = "../../../modules/aws/route53_hosted_zone"

  zone_name = "infra.tf.modules.examples.norecords.test"

  tags = var.tags
}