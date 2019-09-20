# Required
variable "tag_environment" {}
variable "tag_cost_center" {}
variable "tag_domain" {}

# Optional
variable "tag_others" {
  default = {}
}

# Internal
variable "provision" {
  default = true
}
