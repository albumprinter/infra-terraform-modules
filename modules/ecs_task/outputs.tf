output "aws_ecs_task_definition" {
  value = aws_ecs_task_definition.task
}
output "log_group" {
  value = module.log_group.group
}
output "task_role" {
  value = module.task_role.role
}
output "execution_role" {
  value = module.execution_role.role
}