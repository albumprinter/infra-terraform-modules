# Required
variable "domain_name" {}
variable "validation_method" {}
variable "tags" {}

# Optional
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
