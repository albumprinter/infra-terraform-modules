resource "aws_ecr_repository" "repo" {
  count = var.provision == true ? 1 : 0

  # Required
  name = var.name

  # Optional
  tags = merge(local.tags, {
    Name = var.name
  })
}

resource "aws_ecr_repository_policy" "policy" {
  count = var.provision == true && var.aws_organization_id != null ? 1 : 0

  # Internally handled
  repository = aws_ecr_repository.repo[0].name
  policy     = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "Organization",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "ecr:BatchGetImage",
        "ecr:DescribeImages",
        "ecr:GetDownloadUrlForLayer",
        "ecr:ListImages"
      ],
      "Condition": {
        "StringEquals": {
          "aws:PrincipalOrgID": "${var.aws_organization_id}"
        }
      }
    }
  ]
}
EOF
}

resource "aws_ecr_lifecycle_policy" "lifecycle_policy" {
  count = var.provision == true && var.max_number_of_images != null ? 1 : 0

  # Internally handled
  repository = aws_ecr_repository.repo[0].name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keeps only a limited number of images",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": ${var.max_number_of_images}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

# -------------------- Variables --------------------

variable "name" {}
variable "aws_organization_id" {
  default = null
}
variable "max_number_of_images" {
  default = null
}
variable "provision" {
  default = true
}
