resource "aws_api_gateway_api_key" "key" {
  count = var.provision == true && var.api_gateway_api_key_name != null ? 1 : 0

  # Required
  name = var.api_gateway_api_key_name

  # Optional
  description = var.api_gateway_api_key_description
  enabled     = var.api_gateway_api_key_enabled
  value       = var.api_gateway_api_key_value
}

resource "aws_api_gateway_usage_plan" "plan" {
  count = var.provision == true && var.api_gateway_usage_plan_name != null ? 1 : 0

  # Required
  name = var.api_gateway_usage_plan_name

  # Optional
  description = var.api_gateway_usage_plan_description

  dynamic "api_stages" {
    for_each = var.api_gateway_usage_plan_api_stages

    content {
      api_id = api_stages.value.api_id
      stage  = api_stages.value.stage
    }
  }

  dynamic "quota_settings" {
    for_each = [for configuration in var.api_gateway_usage_plan_quota_settings : {
      limit  = lookup(configuration, "limit", null)
      offset = lookup(configuration, "offset", null)
      period = lookup(configuration, "period", null)
    }]

    content {
      limit  = quota_settings.value.limit
      offset = quota_settings.value.offset
      period = quota_settings.value.period
    }
  }

  dynamic "throttle_settings" {
    for_each = [for configuration in var.api_gateway_usage_plan_throttle_settings : {
      burst_limit = lookup(configuration, "burst_limit", null)
      rate_limit  = lookup(configuration, "rate_limit", null)
    }]

    content {
      burst_limit = throttle_settings.value.burst_limit
      rate_limit  = throttle_settings.value.rate_limit
    }
  }

  product_code = var.api_gateway_usage_plan_product_code
}

resource "aws_api_gateway_usage_plan_key" "key" {
  count = var.provision == true && var.api_gateway_api_key_name != null && var.api_gateway_usage_plan_name != null ? 1 : 0

  # Internally handled
  key_id        = aws_api_gateway_api_key.key[0].id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.plan[0].id
}

# -------------------- Variables --------------------

variable "api_gateway_api_key_name" {
  default = null
}
variable "api_gateway_api_key_description" {
  default = null
}
variable "api_gateway_api_key_enabled" {
  default = null
}
variable "api_gateway_api_key_value" {
  default = null
}
variable "api_gateway_usage_plan_name" {
  default = null
}
variable "api_gateway_usage_plan_description" {
  default = null
}
variable "api_gateway_usage_plan_api_stages" {
  default = null
}
variable "api_gateway_usage_plan_quota_settings" {
  default = null
}
variable "api_gateway_usage_plan_throttle_settings" {
  default = null
}
variable "api_gateway_usage_plan_product_code" {
  default = null
}