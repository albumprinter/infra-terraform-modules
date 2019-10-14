# Module: Glue Crawler - Optional Parameters

In order to make this module as flexbile as possible, the following parameters are also exposed and can be combine in any way **accepted by AWS**.

They follow the same name as in the offical Terraform documentation with the addition of a prefix (e.g. _glue_crawler_) to identify to which resource does the parameter belong to.

#### CodeBuild Project

- [classifiers](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#classifiers)
- [configuration](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#configuration)
- [description](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#description)
- [schedule](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#schedule)
- [table_prefix](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#table_prefix)
- [security_configuration](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#security_configuration)
- [glue_crawler_schema_change_policy] (https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#schema_change_policy)
  - Note: This attribute should be passed as an array containing one object with the following parameters:
    - [delete_behavior](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#delete_behavior)
    - [update_behavior](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#update_behavior)
  - Example:

  ```
  glue_crawler_schema_change_policy = [
    {
      delete_behavior = "..."
      update_behavior = "..."
    }
  ]
  ```
- [glue_crawler_dynamodb_target] (https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#dynamodb_target)
  - Note: This attribute should be passed as an array containing one object with the following parameters:
    - [path](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#path)
  - Example:

  ```
  glue_crawler_dynamodb_target = [
    {
      path = "..."
    }
  ]
  ```
- [glue_crawler_jdbc_target] (https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#jdbc_target)
  - Note: This attribute should be passed as an array containing one object with the following parameters:
    - [connection_name](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#connection_name)
    - [path](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#path-1)
    - [exclusions](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#exclusions)
  - Example:

  ```
  glue_crawler_jdbc_target = [
    {
      connection_name = "..."
      path = "..."
      exclusions = "..."
    }
  ]
  ```
- [glue_crawler_s3_target] (https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#s3_target)
  - Note: This attribute should be passed as an array containing one object with the following parameters:
    - [path](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#path-2)
    - [exclusions](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#exclusions-1)
  - Example:

  ```
  glue_crawler_s3_target = [
    {
      path = "..."
      exclusions = "..."
    }
  ]
  ```
- [glue_crawler_catalog_target] (https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#database_name-1)
  - Note: This attribute should be passed as an array containing one object with the following parameters:
    - [database_name](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#database_name-1)
    - [tables](https://www.terraform.io/docs/providers/aws/r/glue_crawler.html#tables)
  - Example:

  ```
  glue_crawler_catalog_target = [
    {
      database_name = "..."
      tables = "..."
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
