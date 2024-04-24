variable "project_name" {}
variable "tags" {
  type = map(any)
}

variable "run_vpc_example" {
  type    = string
  default = true
}

