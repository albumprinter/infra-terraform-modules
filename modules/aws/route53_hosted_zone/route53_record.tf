locals {
  records = [for record in var.records : {
    name                             = record.name
    type                             = record.type
    ttl                              = lookup(record, "alias", null) != null ? record.ttl : lookup(record, "ttl", null)
    records                          = lookup(record, "alias", null) != null ? record.records : lookup(record, "records", null)
    set_identifier                   = lookup(record, "subdivision", null)
    health_check_id                  = lookup(record, "health_check_id", null)
    multivalue_answer_routing_policy = lookup(record, "multivalue_answer_routing_policy", null)
    allow_overwrite                  = lookup(record, "allow_overwrite", null)
    alias                            = lookup(record, "alias", [])
    failover_routing_policy          = lookup(record, "failover_routing_policy", [])
    geolocation_routing_policy       = lookup(record, "geolocation_routing_policy", [])
    latency_routing_policy           = lookup(record, "latency_routing_policy", [])
    weighted_routing_policy          = lookup(record, "weighted_routing_policy", [])
  }]
}

resource "aws_route53_record" "record" {
  count = length(local.records)

  zone_id                          = aws_route53_zone.zone.zone_id
  name                             = local.records[count.index].name
  type                             = local.records[count.index].type
  ttl                              = local.records[count.index].ttl
  records                          = local.records[count.index].records
  set_identifier                   = local.records[count.index].set_identifier
  health_check_id                  = local.records[count.index].health_check_id
  multivalue_answer_routing_policy = local.records[count.index].multivalue_answer_routing_policy
  allow_overwrite                  = local.records[count.index].allow_overwrite

  dynamic "alias" {
    for_each = [for config in local.records[count.index].alias : {
      name                   = config.name
      zone_id                = config.zone_id
      evaluate_target_health = config.evaluate_target_health
    }]

    content {
      name                   = alias.value.name
      zone_id                = alias.value.zone_id
      evaluate_target_health = alias.value.evaluate_target_health
    }
  }

  dynamic "failover_routing_policy" {
    for_each = [for config in local.records[count.index].failover_routing_policy : {
      type = config.type
    }]

    content {
      type = failover_routing_policy.value.type
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = [for config in local.records[count.index].geolocation_routing_policy : {
      continent   = config.continent
      country     = config.country
      subdivision = lookup(config, "subdivision", null)
    }]

    content {
      continent   = geolocation_routing_policy.value.continent
      country     = geolocation_routing_policy.value.country
      subdivision = geolocation_routing_policy.value.subdivision
    }
  }

  dynamic "latency_routing_policy" {
    for_each = [for config in local.records[count.index].latency_routing_policy : {
      region = config.region
    }]

    content {
      region = latency_routing_policy.value.region
    }
  }

  dynamic "weighted_routing_policy" {
    for_each = [for config in local.records[count.index].weighted_routing_policy : {
      weight = config.weight
    }]

    content {
      weight = weighted_routing_policy.value.weight
    }
  }
}

# -------------------- Variables --------------------
variable "records" {
  type    = list
  default = []
}
