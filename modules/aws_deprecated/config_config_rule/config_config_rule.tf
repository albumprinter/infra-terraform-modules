resource "aws_config_config_rule" "rule" {
  # Required
  name = var.config_rule_name
  source {
    owner             = var.config_rule_owner
    source_identifier = var.config_rule_owner == "CUSTOM_LAMBDA" && var.config_rule_source_identifier == null ? module.custom_rule.lambda_function.arn : var.config_rule_source_identifier

    dynamic "source_detail" {
      for_each = [for item in local.config_rule_source_detail : {
        event_source                = "aws.config"
        maximum_execution_frequency = lookup(item, "maximum_execution_frequency", null)
        message_type                = lookup(item, "maximum_execution_frequency", null) != null ? "ScheduledNotification" : lookup(item, "message_type", "ConfigurationItemChangeNotification")
      }]
      content {
        event_source                = source_detail.value.event_source
        maximum_execution_frequency = source_detail.value.maximum_execution_frequency
        message_type                = source_detail.value.message_type
      }
    }
  }

  # Optional
  description                 = var.config_rule_description
  input_parameters            = var.config_rule_input_parameters
  maximum_execution_frequency = var.config_rule_maximum_execution_frequency

  dynamic "scope" {
    for_each = [for item in var.config_rule_scope : {
      compliance_resource_id    = lookup(item, "compliance_resource_id", null)
      compliance_resource_types = lookup(item, "compliance_resource_types", null)
      tag_key                   = lookup(item, "tag_key", null)
      tag_value                 = lookup(item, "tag_value", null)
    }]

    content {
      compliance_resource_id    = scope.value.compliance_resource_id
      compliance_resource_types = scope.value.compliance_resource_types
      tag_key                   = scope.value.tag_key
      tag_value                 = scope.value.tag_value
    }
  }
}

# -------------------- Variables --------------------
variable "config_rule_name" {}
variable "config_rule_owner" {}
variable "config_rule_source_identifier" {
  default = null
}
variable "config_rule_source_detail" {
  type    = list
  default = []
}
variable "config_rule_description" {
  default = null
}
variable "config_rule_input_parameters" {
  default = null
}
variable "config_rule_maximum_execution_frequency" {
  default = null
}
variable "config_rule_scope" {
  type    = list
  default = []
}