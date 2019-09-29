# Module: Step Function State Machine - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

#### IAM Role

- **iam_role_policy_statements**: IAM policy statements granting permissions to the function.
  - Note: The [basic permissions](lambda_function.tf#L37) to write log messages, send dead letter information, and manage VPC interfaces (if applicable) will be granted automatically and don't need to be listed here.
- [iam_role_description](https://www.terraform.io/docs/providers/aws/r/iam_role.html#description)
- [iam_role_force_detach_policies](https://www.terraform.io/docs/providers/aws/r/iam_role.html#force_detach_policies)
- [iam_role_max_session_duration](https://www.terraform.io/docs/providers/aws/r/iam_role.html#max_session_duration)
- [iam_role_name](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name)
- [iam_role_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name_prefix)
- [iam_role_path](https://www.terraform.io/docs/providers/aws/r/iam_role.html#path)
- [iam_role_permissions_boundary](https://www.terraform.io/docs/providers/aws/r/iam_role.html#permissions_boundary)
- [iam_role_policy_description](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#description)
- [iam_role_policy_name](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name)
- [iam_role_policy_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name_prefix)
- [iam_role_policy_path](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#path)
