locals {
  log_group_name = "/codebuild/${var.codebuild_project_name}"
  logs_config = length(var.codebuild_project_logs_config) > 0 ? var.codebuild_project_logs_config : [
    {
      cloudwatch_logs = [
        { 
          group_name = local.log_group_name
        }
      ]
    }
  ]
}