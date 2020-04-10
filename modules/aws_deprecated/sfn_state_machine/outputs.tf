output "sfn_state_machine" {
  value = aws_sfn_state_machine.state_machine
}

output "iam_role" {
  value = module.iam_role.iam_role
}