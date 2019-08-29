output "aws_ecs_task_definition" {
  value = aws_ecs_task_definition.task
}
output "cloudwatch_log_group" {
  value = module.log_group.cloudwatch_log_group
}
output "task_iam_role" {
  value = module.task_role.iam_role
}
output "execution_iam_role" {
  value = module.execution_role.iam_role
}
output "cloudwatch_event_rule" {
  value = module.event_rule.cloudwatch_event_rule
}
output "cloudwatch_event_target" {
  value = module.event_rule.cloudwatch_event_target
}