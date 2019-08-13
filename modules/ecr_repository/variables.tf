# Required
variable "tag_domain" {}
variable "tag_environment" {}
variable "tag_cost_center" {}
variable "name" {}

# Optional
variable "tag_others" {
  default = {}
}
variable "aws_organization_id" {
  default = null
}
variable "max_number_of_images" {
  default = null
}

variable "provision" {
  default = true
}