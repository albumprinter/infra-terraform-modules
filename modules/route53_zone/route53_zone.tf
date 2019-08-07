module "zone" {
  source = "../../resources/route53_zone"
    
  name = var.zone_name
  comment = var.zone_comment
  delegation_set_id = var.zone_delegation_set_id
  force_destroy = var.zone_force_destroy
  vpc = var.zone_vpc
  tags = local.tags
}

module "records" {
  source = "../../resources/route53_record"
  
  zone_id = module.zone.resource.zone_id
  records = var.records 
}

