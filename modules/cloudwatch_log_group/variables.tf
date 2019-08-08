# Required
variable "tag_domain" {}
variable "tag_environment" {}
variable "tag_cost_center" {}

# Optional
variable "name" {
  default = null
}

variable "name_prefix" {
  default = null
}

variable "retention_in_days" {
  default = null
}

variable "kms_key_id" {
  default = null
}
variable "tag_others" {
  default = {}
}
