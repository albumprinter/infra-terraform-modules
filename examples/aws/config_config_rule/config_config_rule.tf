module "config_config_rule_aws" {
  source = "../../../modules/aws/config_config_rule"

  config_rule_name              = "infra-tf-modules-examples-config-rule-aws"
  config_rule_owner             = "AWS"
  config_rule_source_identifier = "INCOMING_SSH_DISABLED"

  tags = var.tags
}

module "config_config_rule_custom" {
  source = "../../../modules/aws/config_config_rule"

  config_rule_name  = "infra-tf-modules-examples-config-rule-custom"
  config_rule_owner = "CUSTOM_LAMBDA"

  tags = var.tags
}

