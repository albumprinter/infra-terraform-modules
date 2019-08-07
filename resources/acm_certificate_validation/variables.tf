# Required
variable "certificate_arn" {}

# Optional
variable "validation_record_fqdns" {
  type = "list"
  default = null
}

# Custom
variable "provision" {
  default = true
}
