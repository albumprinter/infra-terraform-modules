# Required
variable "tags" {
  type = map
}

# Optional
variable "region" {
  default = "eu-west-1"
}

variable "provision" {
  default = true
}
