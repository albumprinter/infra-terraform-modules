variable "function_runtime_nodejs" {
  default = "nodejs10.x"
}
variable "function_runtime_dotnetcore" {
  default = "dotnetcore2.1"
}
variable "function_runtime_python" {
  default = "python3.7"
}

variable "iam_role_policy_statements" {
  default = [
    {
      "Effect" : "Allow",
      "Action" : [
        "s3:ListBucket"
      ],
      "Resource" : ["*"]
    }
  ]
}
variable "tags" {
  type = map
}