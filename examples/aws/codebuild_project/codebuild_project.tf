module "codebuild_project" {
  source = "../../../modules/aws/codebuild_project"

  codebuild_project_name = "infra-tf-modules-examples-codebuild-project"
  
  codebuild_project_source = [
    {
      type = "GITHUB"
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
      "Effect": "Allow",
      "Action": [
        "s3:PutObject"
      ],
      "Resource": [
        "${aws_s3_bucket.artifacts.arn}"
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
      type = "GITHUB"
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
      "Effect": "Allow",
      "Action": [
        "s3:PutObject"
      ],
      "Resource": [
        "${aws_s3_bucket.artifacts.arn}"
      ]
    }
  ]
  
  tags = var.tags
}

