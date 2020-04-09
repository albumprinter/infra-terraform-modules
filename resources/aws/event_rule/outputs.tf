output "cloudwatch_event_rule" {
  value = aws_cloudwatch_event_rule.rule
}
output "cloudwatch_event_target" {
  value = aws_cloudwatch_event_target.target
}