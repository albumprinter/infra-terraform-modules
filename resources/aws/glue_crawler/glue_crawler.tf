resource "aws_glue_crawler" "crawler" {
  # Required
  database_name = var.glue_crawler_database_name
  name          = var.glue_crawler_name

  # Internally handled
  role = module.iam_role.iam_role.arn

  # Optional
  classifiers            = var.glue_crawler_classifiers
  configuration          = var.glue_crawler_configuration
  description            = var.glue_crawler_description
  schedule               = var.glue_crawler_schedule
  table_prefix           = var.glue_crawler_table_prefix
  security_configuration = var.glue_crawler_security_configuration

  dynamic "schema_change_policy" {
    for_each = [for element in var.glue_crawler_schema_change_policy : {
      delete_behavior = lookup(element, "delete_behavior", null)
      update_behavior = lookup(element, "update_behavior", null)
    }]

    content {
      delete_behavior = schema_change_policy.value.delete_behavior
      update_behavior = schema_change_policy.value.update_behavior
    }
  }

  dynamic "dynamodb_target" {
    for_each = var.glue_crawler_dynamodb_target

    content {
      path = dynamodb_target.value.path
    }
  }

  dynamic "jdbc_target" {
    for_each = [for element in var.glue_crawler_jdbc_target : {
      connection_name = element.connection_name
      path            = element.path
      exclusions      = lookup(element, "exclusions", null)
    }]

    content {
      connection_name = jdbc_target.value.connection_name
      path            = jdbc_target.value.path
      exclusions      = jdbc_target.value.exclusions
    }
  }

  dynamic "s3_target" {
    for_each = [for element in var.glue_crawler_s3_target : {
      path       = element.path
      exclusions = lookup(element, "exclusions", null)
    }]

    content {
      path       = s3_target.value.path
      exclusions = s3_target.value.exclusions
    }
  }

  dynamic "catalog_target" {
    for_each = var.glue_crawler_catalog_target

    content {
      database_name = catalog_target.value.database_name
      tables        = catalog_target.value.tables
    }
  }
}

# -------------------- Variables --------------------

variable "glue_crawler_database_name" {}
variable "glue_crawler_name" {}
variable "glue_crawler_classifiers" {
  default = null
}
variable "glue_crawler_configuration" {
  default = null
}
variable "glue_crawler_description" {
  default = null
}
variable "glue_crawler_schedule" {
  default = null
}
variable "glue_crawler_table_prefix" {
  default = null
}
variable "glue_crawler_security_configuration" {
  default = null
}
variable "glue_crawler_schema_change_policy" {
  default = []
}
variable "glue_crawler_dynamodb_target" {
  default = []
}
variable "glue_crawler_jdbc_target" {
  default = []
}
variable "glue_crawler_s3_target" {
  default = []
}
variable "glue_crawler_catalog_target" {
  default = []
}