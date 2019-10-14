module "codebuild_project" {
  source = "../../../modules/aws/codebuild_project"

  codebuild_project_name = "infra-tf-modules-examples-codebuild-project"

  codebuild_project_source = [
    {
      type     = "GITHUB"
      location = "https://github.com/albumprinter/infra-terraform-modules"
    }
  ]

  codebuild_project_artifacts = [
    {
      type     = "S3"
      location = "${aws_s3_bucket.artifacts.id}"
    }
  ]

  iam_role_policy_statements = [
    {
      "Effect" : "Allow",
      "Action" : [
        "s3:PutObject"
      ],
      "Resource" : [
        "${aws_s3_bucket.artifacts.arn}/*"
      ]
    }
  ]

  tags = var.tags
}

module "codebuild_project_vpc" {
  source = "../../../modules/aws/codebuild_project"

  codebuild_project_name = "infra-tf-modules-examples-codebuild-project-vpc"

  codebuild_project_source = [
    {
      type     = "GITHUB"
      location = "https://github.com/albumprinter/infra-terraform-modules"
    }
  ]

  codebuild_project_artifacts = [
    {
      type     = "S3"
      location = "${aws_s3_bucket.artifacts.id}"
    }
  ]

  codebuild_project_vpc_config = [
    {
      subnets            = data.aws_subnet_ids.private.ids,
      security_group_ids = [module.security_group.security_group.id]
      vpc_id             = data.aws_vpc.vpc.id
    }
  ]

  iam_role_policy_statements = [
    {
      "Effect" : "Allow",
      "Action" : [
        "s3:PutObject"
      ],
      "Resource" : [
        "${aws_s3_bucket.artifacts.arn}/*"
      ]
    }
  ]

  tags = var.tags
}

module "codebuild_project_environment" {
  source = "../../../modules/aws/codebuild_project"

  codebuild_project_name = "infra-tf-modules-examples-codebuild-project-environment"

  codebuild_project_source = [
    {
      type     = "GITHUB"
      location = "https://github.com/albumprinter/infra-terraform-modules"
    }
  ]

  codebuild_project_artifacts = [
    {
      type     = "S3"
      location = "${aws_s3_bucket.artifacts.id}"
    }
  ]

  codebuild_project_environment = [
    {
      compute_type = "BUILD_GENERAL1_MEDIUM"
      image        = "hashicorp/terraform:latest"
      type         = "LINUX_CONTAINER"
      environment_variables = [
        {
          name  = "VARIABLE_1"
          value = "test 1"
          type  = "PLAINTEXT"
        },
        {
          name  = "VARIABLE_2"
          value = "test 2"
          type  = "PLAINTEXT"
        }
      ]
    }
  ]

  iam_role_policy_statements = [
    {
      "Effect" : "Allow",
      "Action" : [
        "s3:PutObject"
      ],
      "Resource" : [
        "${aws_s3_bucket.artifacts.arn}/*"
      ]
    }
  ]

  tags = var.tags
}

module "codebuild_project_cache" {
  source = "../../../modules/aws/codebuild_project"

  codebuild_project_name = "infra-tf-modules-examples-codebuild-project-cache"

  codebuild_project_source = [
    {
      type     = "GITHUB"
      location = "https://github.com/albumprinter/infra-terraform-modules"
    }
  ]

  codebuild_project_artifacts = [
    {
      type     = "S3"
      location = "${aws_s3_bucket.artifacts.id}"
    }
  ]

  codebuild_project_cache = [
    {
      type     = "S3"
      location = "${aws_s3_bucket.artifacts.id}"
    }
  ]

  iam_role_policy_statements = [
    {
      "Effect" : "Allow",
      "Action" : [
        "s3:PutObject"
      ],
      "Resource" : [
        "${aws_s3_bucket.artifacts.arn}/*"
      ]
    }
  ]

  tags = var.tags
}

module "codebuild_project_secondary" {
  source = "../../../modules/aws/codebuild_project"

  codebuild_project_name = "infra-tf-modules-examples-codebuild-project-secondary"

  codebuild_project_source = [
    {
      type     = "GITHUB"
      location = "https://github.com/albumprinter/infra-terraform-modules"
    }
  ]

  codebuild_project_artifacts = [
    {
      type     = "S3"
      location = "${aws_s3_bucket.artifacts.id}"
    }
  ]

  codebuild_project_secondary_artifacts = [
    {
      type                = "S3"
      artifact_identifier = "secondary"
      location            = "${aws_s3_bucket.artifacts.id}"
    }
  ]

  codebuild_project_secondary_sources = [
    {
      type              = "S3"
      source_identifier = "secondary_source"
      location          = "${aws_s3_bucket.artifacts.id}/source.zip"
    }
  ]

  iam_role_policy_statements = [
    {
      "Effect" : "Allow",
      "Action" : [
        "s3:PutObject",
        "s3:GetObject"
      ],
      "Resource" : [
        "${aws_s3_bucket.artifacts.arn}/*"
      ]
    }
  ]

  tags = var.tags
}

module "codebuild_project_s3_logs" {
  source = "../../../modules/aws/codebuild_project"

  codebuild_project_name = "infra-tf-modules-examples-codebuild-project-s3-logs"

  codebuild_project_source = [
    {
      type     = "GITHUB"
      location = "https://github.com/albumprinter/infra-terraform-modules"
    }
  ]

  codebuild_project_artifacts = [
    {
      type     = "S3"
      location = "${aws_s3_bucket.artifacts.id}"
    }
  ]

  codebuild_project_logs_config = [{
    s3_logs = [{
      status   = "ENABLED"
      location = "${aws_s3_bucket.artifacts.id}/build-log"
    }]
  }]

  iam_role_policy_statements = [
    {
      "Effect" : "Allow",
      "Action" : [
        "s3:PutObject"
      ],
      "Resource" : [
        "${aws_s3_bucket.artifacts.arn}/*"
      ]
    }
  ]

  tags = var.tags
}