# Required
variable "tag_environment" {}

variable "tag_cost_center" {}

variable "tag_domain" {}

# Optional
variable "tag_others" {
  default = {}
}

## ---------------- ACM Certificate ----------------
# Required
variable "domain_name" {}

# Optional
variable "validation_method" {
  default = "DNS"
}
variable "subject_alternative_names" {
  default = null
}
variable "private_key" {
  default = null
}
variable "certificate_body" {
  default = null
}
variable "certificate_chain" {
  default = null
}
variable "hosted_zone_ids" {
  type = "map"
  default = {}
}
