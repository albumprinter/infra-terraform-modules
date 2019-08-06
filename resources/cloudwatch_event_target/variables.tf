# Required
variable "arn" {}
variable "rule" {}

# Optional
variable "target_id" {
  default = null
}
variable "input" {
  default = null
}
variable "input_path" {
  default = null
}
variable "role_arn" {
  default = null
}
variable "batch_target" {
  default = []
}
variable "ecs_target" {
  default = []
}
variable "input_transformer" {
  default = []
}
variable "kinesis_target" {
  default = []
}
variable "run_command_targets" {
  default = []
}
variable "sqs_target" {
  default = []
}

# Custom
variable "provision" {
  default = true
}