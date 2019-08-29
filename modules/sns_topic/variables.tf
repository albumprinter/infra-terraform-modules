# Required
variable "tag_domain" {}
variable "tag_environment" {}
variable "tag_cost_center" {}

# Optional
variable "tag_others" {
  default = {}
}

# Custom
variable "provision" {
  default = true
}