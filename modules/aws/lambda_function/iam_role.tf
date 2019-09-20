module "role" {
  source    = "../iam_role"
  provision = var.provision == true ? true : false

  # Required
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
  tag_domain      = var.tag_domain

  # Internally handled
  assume_role_principal = "lambda.amazonaws.com"
  policy_statements = concat(var.iam_role_policy_statements, [
    {
      "Effect" : "Allow",
      "Action" : [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource" : ["arn:aws:logs:*:*:*"]
    },
    {
      "Effect" : "Allow",
      "Action" : [
        "${var.function_dead_letter_target_type == "SQS" ? "sqs:SendMessage" : "sns:Publish"}"
      ],
      "Resource" : ["arn:aws:${var.function_dead_letter_target_type == "SQS" ? "sqs" : "sns"}:eu-west-1:*:${local.function_dead_letter_target_name}"]
    }
    ],
    length(var.function_vpc_config) == 0 ? [] : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface"
        ],
        "Resource" : ["*"]
      }
  ])

  # Optional  
  role_description           = var.iam_role_description
  role_force_detach_policies = var.iam_role_force_detach_policies
  role_max_session_duration  = var.iam_role_max_session_duration
  role_name                  = var.iam_role_name != null ? var.iam_role_name : var.function_name
  role_name_prefix           = var.iam_role_name_prefix
  role_path                  = var.iam_role_path
  role_permissions_boundary  = var.iam_role_permissions_boundary
  policy_description         = var.iam_role_policy_description
  policy_name                = var.iam_role_policy_name != null ? var.iam_role_policy_name : var.function_name
  policy_name_prefix         = var.iam_role_policy_name_prefix
  policy_path                = var.iam_role_policy_path

  tag_others = var.tag_others
}

# ----------------------- Variables -----------------------

variable "iam_role_policy_statements" {
  default = []
}
variable "iam_role_description" {
  default = null
}

variable "iam_role_force_detach_policies" {
  default = null
}

variable "iam_role_max_session_duration" {
  default = null
}

variable "iam_role_name" {
  default = null
}

variable "iam_role_name_prefix" {
  default = null
}

variable "iam_role_path" {
  default = null
}

variable "iam_role_permissions_boundary" {
  default = null
}

variable "iam_role_policy_description" {
  default = null
}

variable "iam_role_policy_name" {
  default = null
}

variable "iam_role_policy_name_prefix" {
  default = null
}

variable "iam_role_policy_path" {
  default = null
}