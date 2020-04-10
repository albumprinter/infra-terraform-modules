# Module: CodeBuild Project - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

They follow the same name as in the offical Terraform documentation with the addition of a prefix (e.g. _codebuild_project_) to identify to which resource does the parameter belong to.

#### CodeBuild Project

- [codebuild_project_environment](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#environment)

  - Note: This attribute should be passed as an array containing one object with the following parameters:
    - [compute_type](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#compute_type)
    - [image](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#image)
    - [type](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#type-2)
    - [image_pull_credentials_type](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#image_pull_credentials_type)
    - [environment_variables](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#environment_variable)
      - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
        - [name](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#name-2)
        - [value](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#value)
        - [type](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#type-3)
    - [privileged_mode](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#privileged_mode)
    - [certificate](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#certificate)
    - [registry_credential](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#registry_credential)
      - Note: This attribute should be passed as an array containing one object with the following parameters:
        - [credential](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#credential)
        - [credential_provider](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#credential_provider)
  - Example:

  ```
  codebuild_project_environment = [
    {
      compute_type = "..."
      image        = "..."
      type         = "..."
      environment_variables = [
        {
          name = "..."
          value = "..."
          type = "..."
        },
        {
          name = "..."
          value = "..."
          type = "..."
        }
      ]
    }
  ]
  ```

- [codebuild_project_badge_enabled](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#badge_enabled)
- [codebuild_project_build_timeout](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#build_timeout)
- [codebuild_project_cache](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#cache)

  - Note: This attribute should be passed as an array containing one object with the following parameters:
    - [type](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#type-1)
    - [location](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#location-1)
    - [modes](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#modes)
  - Example:

  ```
  codebuild_project_cache = [
    {
      type = "..."
      location = "..."
      modes = "..."
    }
  ]
  ```

- [codebuild_project_description](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#description)
- [codebuild_project_encryption_key](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#encryption_key)
- [codebuild_project_logs_config](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#logs_config)

  - Note: This attribute should be passed as an array containing one object with the following parameters:

    - [s3_logs](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#s3_logs)

      - Note: This attribute should be passed as an array containing one object with the following parameters:
        - [status](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#status-1)
        - [location](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#location-2)
        - [encryption_disabled](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#encryption_disabled-1)

  - Example:

  ```
  codebuild_project_logs_config = [
    {
      s3_logs = [
        {
          status = "..."
          location = "..."
        }
      ]
    }
  ]
  ```

- [codebuild_project_vpc_config](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#vpc_config)

  - Note: This attribute should be passed as an array containing one object with the following parameters:
    - [security_group_ids](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#security_group_ids)
    - [subnets](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#subnets)
    - [vpc_id](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#vpc_id)
  - Example:

  ```
  codebuild_project_vpc_config = [
    {
      security_group_ids = [...]
      subnets = [...]
      vpc_id = "..."
    }
  ]
  ```

- [codebuild_project_secondary_artifacts](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#secondary_artifacts)

  - Note: This attribute should be passed as an array containing one or more objects with the following parameters:
    - [type](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#type-6)
    - [artifact_identifier](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#artifact_identifier-1)
    - [encryption_disabled](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#encryption_disabled-2)
    - [override_artifact_name](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#override_artifact_name-1)
    - [location](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#location-4)
    - [name](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#name-3)
    - [namespace_type](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#namespace_type-1)
    - [packaging](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#packaging-1)
    - [path](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#path-1)
  - Example:

  ```
  codebuild_project_secondary_artifacts = [
    {
      type = "..."
      artifact_identifier = "..."
    },
    {
      type = "..."
      artifact_identifier = "..."
    }
  ]
  ```

- [codebuild_project_secondary_sources](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#secondary_sources)

  - Note: This attribute should be passed as an array containing one or more objects with the following parameters:

    - [type](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#type-7)
    - [source_identifier](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#source_identifier)
      - [auth](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#auth-1)
        - Note: This attribute should be passed as an array containing one object with the following parameters:
          - [type](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#type-5)
          - [resource](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#resource)
      - [buildspec](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#buildspec-1)
      - [git_clone_depth](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#git_clone_depth-1)
      - [insecure_ssl](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#insecure_ssl-1)
      - [location](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#location-5)
      - [report_build_status](https://www.terraform.io/docs/providers/aws/r/codebuild_project.html#report_build_status-1)
    - Example:

    ```
    codebuild_project_secondary_sources = [
      {
        type = "..."
        location = "..."
        auth = [
          {
            type = "OAUTH"
            resource = "..."
          }
        ]
      }
    ]
    ```

---

#### IAM Role

- **iam_role_policy_statements**: IAM policy statements granting permissions to the project.
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

---

#### CloudWatch Log Group

- [log_group_name](https://www.terraform.io/docs/providers/aws/r/cloudwatch_log_group.html#name)
- [log_group_retention_in_days](https://www.terraform.io/docs/providers/aws/r/cloudwatch_log_group.html#retention_in_days)
  - Note: by default, uses the value `30` if not specified
- [log_group_kms_key_id](https://www.terraform.io/docs/providers/aws/r/cloudwatch_log_group.html#kms_key_id)
