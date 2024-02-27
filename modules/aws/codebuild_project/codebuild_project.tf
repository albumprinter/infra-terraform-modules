resource "aws_codebuild_project" "project" {
  # Required
  name = var.codebuild_project_name
  tags = var.tags

  dynamic "artifacts" {
    for_each = [for element in var.codebuild_project_artifacts : {
      type                   = element.type
      artifact_identifier    = lookup(element, "artifact_identifier", null)
      encryption_disabled    = lookup(element, "encryption_disabled", null)
      override_artifact_name = lookup(element, "override_artifact_name", null)
      location               = lookup(element, "location", null)
      name                   = lookup(element, "name", null)
      namespace_type         = lookup(element, "namespace_type", null)
      packaging              = lookup(element, "packaging", null)
      path                   = lookup(element, "path", null)
    }]

    content {
      type                   = artifacts.value.type
      artifact_identifier    = artifacts.value.artifact_identifier
      encryption_disabled    = artifacts.value.encryption_disabled
      override_artifact_name = artifacts.value.override_artifact_name
      location               = artifacts.value.location
      name                   = artifacts.value.name
      namespace_type         = artifacts.value.namespace_type
      packaging              = artifacts.value.packaging
      path                   = artifacts.value.path
    }
  }

  dynamic "environment" {
    for_each = [for element in var.codebuild_project_environment : {
      compute_type                = element.compute_type
      image                       = element.image
      type                        = element.type
      image_pull_credentials_type = lookup(element, "image_pull_credentials_type", null)
      environment_variables       = lookup(element, "environment_variables", [])
      privileged_mode             = lookup(element, "privileged_mode", null)
      certificate                 = lookup(element, "certificate", null)
      registry_credential         = lookup(element, "registry_credential", [])
    }]

    content {
      compute_type                = environment.value.compute_type
      image                       = environment.value.image
      type                        = environment.value.type
      image_pull_credentials_type = environment.value.image_pull_credentials_type
      dynamic "environment_variable" {
        for_each = [for element in environment.value.environment_variables : {
          name  = element.name
          value = element.value
          type  = lookup(element, "type", null)
        }]

        content {
          name  = environment_variable.value.name
          value = environment_variable.value.value
          type  = environment_variable.value.type
        }
      }
      privileged_mode = environment.value.privileged_mode
      certificate     = environment.value.certificate
      dynamic "registry_credential" {
        for_each = [for element in environment.value.registry_credential : {
          credential          = element.credential
          credential_provider = element.credential_provider
        }]

        content {
          credential          = registry_credential.value.credential
          credential_provider = registry_credential.value.credential_provider
        }
      }
    }
  }

  dynamic "source" {
    for_each = [for element in var.codebuild_project_source : {
      type                = element.type
      buildspec           = lookup(element, "buildspec", null)
      git_clone_depth     = lookup(element, "git_clone_depth", null)
      insecure_ssl        = lookup(element, "insecure_ssl", null)
      location            = lookup(element, "location", null)
      report_build_status = lookup(element, "report_build_status", null)
    }]

    content {
      type = source.value.type
      buildspec           = source.value.buildspec
      git_clone_depth     = source.value.git_clone_depth
      insecure_ssl        = source.value.insecure_ssl
      location            = source.value.location
      report_build_status = source.value.report_build_status
    }
  }

  # Internally handled
  service_role = module.iam_role.iam_role.arn

  # Optional
  badge_enabled = var.codebuild_project_badge_enabled
  build_timeout = var.codebuild_project_build_timeout
  dynamic "cache" {
    for_each = [for element in var.codebuild_project_cache : {
      type     = lookup(element, "type", null)
      location = lookup(element, "location", null)
      modes    = lookup(element, "modes", null)
      }

    ]
    content {
      type     = cache.value.type
      location = cache.value.location
      modes    = cache.value.modes
    }
  }
  description    = var.codebuild_project_description
  encryption_key = var.codebuild_project_encryption_key

  dynamic "logs_config" {
    for_each = [for element in var.codebuild_project_logs_config : {
      cloudwatch_logs = [
        {
          group_name = module.log_group.cloudwatch_log_group.name
        }
      ]
      s3_logs = lookup(element, "s3_logs", [])
    }]

    content {
      dynamic "cloudwatch_logs" {
        for_each = [for element in logs_config.value.cloudwatch_logs : {
          status      = lookup(element, "status", null)
          group_name  = lookup(element, "group_name", null)
          stream_name = lookup(element, "stream_name", null)
        }]

        content {
          status      = cloudwatch_logs.value.status
          group_name  = cloudwatch_logs.value.group_name
          stream_name = cloudwatch_logs.value.stream_name
        }
      }
      dynamic "s3_logs" {
        for_each = [for element in logs_config.value.s3_logs : {
          status              = lookup(element, "status", null)
          location            = lookup(element, "location", null)
          encryption_disabled = lookup(element, "encryption_disabled", null)
        }]

        content {
          status              = s3_logs.value.status
          location            = s3_logs.value.location
          encryption_disabled = s3_logs.value.encryption_disabled
        }
      }
    }
  }
  dynamic "vpc_config" {
    for_each = [for element in var.codebuild_project_vpc_config : {
      security_group_ids = element.security_group_ids
      subnets            = element.subnets
      vpc_id             = element.vpc_id
    }]

    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnets            = vpc_config.value.subnets
      vpc_id             = vpc_config.value.vpc_id
    }
  }

  dynamic "secondary_artifacts" {
    for_each = [for element in var.codebuild_project_secondary_artifacts : {
      type                   = element.type
      artifact_identifier    = element.artifact_identifier
      encryption_disabled    = lookup(element, "encryption_disabled", null)
      override_artifact_name = lookup(element, "override_artifact_name", null)
      location               = lookup(element, "location", null)
      name                   = lookup(element, "name", null)
      namespace_type         = lookup(element, "namespace_type", null)
      packaging              = lookup(element, "packaging", null)
      path                   = lookup(element, "path", null)
    }]
    content {
      type                   = secondary_artifacts.value.type
      artifact_identifier    = secondary_artifacts.value.artifact_identifier
      encryption_disabled    = secondary_artifacts.value.encryption_disabled
      override_artifact_name = secondary_artifacts.value.override_artifact_name
      location               = secondary_artifacts.value.location
      name                   = secondary_artifacts.value.name
      namespace_type         = secondary_artifacts.value.namespace_type
      packaging              = secondary_artifacts.value.packaging
      path                   = secondary_artifacts.value.path
    }
  }
  dynamic "secondary_sources" {
    for_each = [for element in var.codebuild_project_secondary_sources : {
      type                = element.type
      source_identifier   = element.source_identifier
      buildspec           = lookup(element, "buildspec", null)
      git_clone_depth     = lookup(element, "git_clone_depth", null)
      insecure_ssl        = lookup(element, "insecure_ssl", null)
      location            = lookup(element, "location", null)
      report_build_status = lookup(element, "report_build_status", null)
    }]
    content {
      type              = secondary_sources.value.type
      source_identifier = secondary_sources.value.source_identifier
      buildspec           = secondary_sources.value.buildspec
      git_clone_depth     = secondary_sources.value.git_clone_depth
      insecure_ssl        = secondary_sources.value.insecure_ssl
      location            = secondary_sources.value.location
      report_build_status = secondary_sources.value.report_build_status
    }
  }
}

# -------------------- Variables --------------------

variable "codebuild_project_name" {}
variable "codebuild_project_source" {}
variable "codebuild_project_artifacts" {}
variable "codebuild_project_environment" {
  default = [
    {
      compute_type = "BUILD_GENERAL1_SMALL"
      image        = "aws/codebuild/standard:2.0"
      type         = "LINUX_CONTAINER"
    }
  ]
}
variable "codebuild_project_badge_enabled" {
  default = null
}
variable "codebuild_project_build_timeout" {
  default = null
}
variable "codebuild_project_cache" {
  type    = list
  default = []
}
variable "codebuild_project_description" {
  default = null
}
variable "codebuild_project_encryption_key" {
  default = null
}
variable "codebuild_project_logs_config" {
  type    = list
  default = [{}]
}
variable "codebuild_project_vpc_config" {
  type    = list
  default = []
}
variable "codebuild_project_secondary_artifacts" {
  type    = list
  default = []
}
variable "codebuild_project_secondary_sources" {
  type    = list
  default = []
}