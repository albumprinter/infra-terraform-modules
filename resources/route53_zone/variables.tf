variable "tags" {}
variable "name" {}
variable "comment" {
  default = null
}
variable "delegation_set_id" {
  default = null
}
variable "force_destroy" {
  default = null
}
variable "vpc" {
  type = "list"
  default = []
}
