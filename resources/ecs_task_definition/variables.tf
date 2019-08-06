# Required
variable "family" {}
variable "container_definitions" {}

# Optional
variable "task_role_arn" {
  default = null
}
variable "execution_role_arn" {
  default = null
}
variable "network_mode" {
  default = null
}
variable "ipc_mode" {
  default = null
}
variable "pid_mode" {
  default = null
}
variable "volumes" {
  default = []
}
variable "placement_constraints" {
  default = []
}
variable "cpu" {
  default = null
}
variable "memory" {
  default = null
}
variable "requires_compatibilities" {
  default = null
}
variable "proxy_configuration" {
  default = []
}
variable "tags" {
  default = null
}