# Module: Route 53 Zone - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

They follow the same name as in the offical Terraform documentation with the addition of a prefix (e.g. _zone\__) to identify to which resource does the parameter belong to.

#### Route 53 Zone

- [zone_comment](https://www.terraform.io/docs/providers/aws/r/route53_zone.html#comment)
- [zone_delegation_set_id](https://www.terraform.io/docs/providers/aws/r/route53_zone.html#delegation_set_id)
- [zone_force_destroy](https://www.terraform.io/docs/providers/aws/r/route53_zone.html#force_destroy)
- [zone_vpc](https://www.terraform.io/docs/providers/aws/r/route53_zone.html#vpc)
  - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    - [vpc_id](https://www.terraform.io/docs/providers/aws/r/route53_zone.html#vpc_id)
    - [vpc_region](https://www.terraform.io/docs/providers/aws/r/route53_zone.html#vpc_region)
  - Example:

```
zone_vpc = [
  {
    vpc_id = "..."
    vpc_region = "..."
  }
]
```

---

#### Route 53 Record

- records
  - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    - [name](https://www.terraform.io/docs/providers/aws/r/route53_record.html#name)
    - [type](https://www.terraform.io/docs/providers/aws/r/route53_record.html#type)
    - [ttl](https://www.terraform.io/docs/providers/aws/r/route53_record.html#ttl)
    - [records](https://www.terraform.io/docs/providers/aws/r/route53_record.html#records)
    - [set_identifier](https://www.terraform.io/docs/providers/aws/r/route53_record.html#set_identifier)
    - [health_check_id](https://www.terraform.io/docs/providers/aws/r/route53_record.html#health_check_id)
    - [multivalue_answer_routing_policy](https://www.terraform.io/docs/providers/aws/r/route53_record.html#multivalue_answer_routing_policy)
    - [allow_overwrite](https://www.terraform.io/docs/providers/aws/r/route53_record.html#allow_overwrite)
    - [alias](https://www.terraform.io/docs/providers/aws/r/route53_record.html#alias)
      - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
        - [name](https://www.terraform.io/docs/providers/aws/r/route53_record.html#name-1)
        - [zone_id](https://www.terraform.io/docs/providers/aws/r/route53_record.html#zone_id-1)
        - [evaluate_target_health](https://www.terraform.io/docs/providers/aws/r/route53_record.html#evaluate_target_health)
    - [failover_routing_policy](https://www.terraform.io/docs/providers/aws/r/route53_record.html#failover_routing_policy)
      - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
        - [type](https://www.terraform.io/docs/providers/aws/r/route53_record.html#type-1)
    - [geolocation_routing_policy](https://www.terraform.io/docs/providers/aws/r/route53_record.html#geolocation_routing_policy)
      - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
        - [continent](https://www.terraform.io/docs/providers/aws/r/route53_record.html#continent)
        - [country](https://www.terraform.io/docs/providers/aws/r/route53_record.html#country)
        - [subdivision](https://www.terraform.io/docs/providers/aws/r/route53_record.html#subdivision)
    - [latency_routing_policy](https://www.terraform.io/docs/providers/aws/r/route53_record.html#latency_routing_policy)
      - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
        - [region ](https://www.terraform.io/docs/providers/aws/r/route53_record.html#region)
    - [weighted_routing_policy](https://www.terraform.io/docs/providers/aws/r/route53_record.html#weighted_routing_policy)
      - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
        - [weight](https://www.terraform.io/docs/providers/aws/r/route53_record.html#weight)
  - Example:

```
records = [
  {
    name = "..."
    type = "..."
    ttl = "..."
    records = "..."
    set_identifier = "..."
    health_check_id = "..."
    multivalue_answer_routing_policy = "..."
    allow_overwrite = "..."
    alias = [
      {
        name = "..."
        zone_id = "..."
        evaluate_target_health = "..."
      }
    ]
    failover_routing_policy = [
      {
        type = "..."
      }
    ]
    geolocation_routing_policy = [
      {
        continent = "..."
        country = "..."
        subdivision = "..."
      }
    ]
    latency_routing_policy = [
      {
        region = "..."
      }
    ]
    weighted_routing_policy = [
      {
        weight = "..."
      }
    ]
  }
]
```
