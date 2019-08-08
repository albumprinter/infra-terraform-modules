# Required
variable "tag_environment" {}

variable "tag_cost_center" {}

variable "tag_domain" {}

# Optional
variable "tag_others" {
  default = {}
}

## ---------------- Route 53 Zone ----------------
# Required
variable "zone_name" {}

# Optional
variable "zone_comment" {
  default = null
}
variable "zone_delegation_set_id" {
  default = null
}
variable "zone_force_destroy" {
  default = null
}
variable "zone_vpc" {
  default = []
}
variable "prevent_destroy" {
  default = true
}


## ---------------- Route 53 Record ----------------
# Optional
variable "records" {
  type = "list"
  default = []
}