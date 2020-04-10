output "config_config_rule" {
  value = aws_config_config_rule.rule
}

output "custom_rule_lambda_function" {
  value = module.custom_rule.lambda_function
}

output "custom_rule_iam_role" {
  value = module.custom_rule.iam_role
}
