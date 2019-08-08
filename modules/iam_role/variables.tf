# Required
## e.g. lambda.amazonaws.com, events.amazonaws.com, etc
variable "assume_role_principal" {}
variable "tag_environment" {}
variable "tag_cost_center" {}
variable "tag_domain" {}

# Optional
variable "policy_statements" {
  type = "list"
  default = []
}

variable "assume_role_principal_type" {
  default = "Service"
}

variable "role_description" {
  default = null
}

variable "role_force_detach_policies" {
  default = null
}

variable "role_max_session_duration" {
  default = null
}

variable "role_name" {
  default = null
}

variable "role_name_prefix" {
  default = null
}

variable "role_path" {
  default = null
}

variable "role_permissions_boundary" {
  default = null
}

variable "policy_description" {
  default = null
}

variable "policy_name" {
  default = null
}

variable "policy_name_prefix" {
  default = null
}

variable "policy_path" {
  default = null
}

variable "tag_others" {
  default = {}
}
