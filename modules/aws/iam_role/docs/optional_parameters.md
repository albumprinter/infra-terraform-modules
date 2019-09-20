# Module: IAM Role - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

They follow the same name as in the offical Terraform documentation with the addition of a prefix (e.g. *role_*) to identify to which resource does the parameter belong to.

#### Tags

* **tag_others**: map containing any extra tags that should be added to the resources except for the required tags.

------

#### IAM Role

* policy_statements
  * Note: This attribute should be passed as an array containing policy statements:
  * Example:
```
policy_statements = [
  {
    "Effect" : "Allow",
    "Action" : [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ],
    "Resource" : ["arn:aws:logs:*:*:*"]
  }
]
```
* assume_role_principal_type
  * Note: by default, uses the value `Service` if not specified. Other available option is `AWS`.
* [role_description](https://www.terraform.io/docs/providers/aws/r/iam_role.html#description)
* [role_force_detach_policies](https://www.terraform.io/docs/providers/aws/r/iam_role.html#force_detach_policies)
* [role_max_session_duration]()
* [role_name](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name)
* [role_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_role.html#name_prefix)
* [role_path](https://www.terraform.io/docs/providers/aws/r/iam_role.html#path)
* [role_permissions_boundary](https://www.terraform.io/docs/providers/aws/r/iam_role.html#permissions_boundary)

------

#### IAM Policy

* [policy_description](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#description)
* [policy_name](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name)
* [policy_name_prefix](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#name_prefix)
* [policy_path](https://www.terraform.io/docs/providers/aws/r/iam_policy.html#path)
