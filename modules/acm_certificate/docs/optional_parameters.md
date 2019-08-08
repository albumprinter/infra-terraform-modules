# Module: ACM Certificate - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

They follow the same name as in the offical Terraform documentation.

#### Tags

* **tag_others**: map containing any extra tags that should be added to the resources except for the required tags.
  * Note: The tag `name` shouldn't be used in this map, otherwise all resources will be tagged with the same value.

------

#### ACM Certificate

* [validation_method](https://www.terraform.io/docs/providers/aws/r/acm_certificate.html#validation_method)
* [subject_alternative_names](https://www.terraform.io/docs/providers/aws/r/acm_certificate.html#subject_alternative_names)
* [private_key](https://www.terraform.io/docs/providers/aws/r/acm_certificate.html#private_key)
* [certificate_body](https://www.terraform.io/docs/providers/aws/r/acm_certificate.html#certificate_body)
* [certificate_chain](https://www.terraform.io/docs/providers/aws/r/acm_certificate.html#certificate_chain)
* hosted_zone_ids
  * Note: This attribute should be passed as a map containing domains included in the certificate along with their Route 53 Hosted Zone IDs:
  * Example:
```
hosted_zone_ids = {
  "*.sandbox.infra.albelli.com" = "Z3D9HBL9U0Q0MB"
}
```
