# Required
variable "tag_environment" {}

variable "tag_cost_center" {}

variable "tag_domain" {}

# Optional
variable "tag_others" {
  default = {}
}

variable "region" {
  default = "eu-west-1"
}

variable "provision" {
  default = true
}
