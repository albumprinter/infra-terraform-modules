module "config_config_rule_aws" {
  source = "../../modules/config_config_rule"  

  config_rule_name              = "infra-tf-modules-examples-config-rule-aws"
  config_rule_owner             = "AWS"
  config_rule_source_identifier = "INCOMING_SSH_DISABLED"

  tag_domain      = var.tag_domain
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
}

module "config_config_rule_custom" {
  source = "../../modules/config_config_rule"  

  config_rule_name              = "infra-tf-modules-examples-config-rule-custom"
  config_rule_owner             = "CUSTOM_LAMBDA"

  tag_domain      = var.tag_domain
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
}

