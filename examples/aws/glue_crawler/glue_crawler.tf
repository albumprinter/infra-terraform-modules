module "glue_crawler_s3_target" {
  source = "../../../modules/aws/glue_crawler"

  glue_crawler_name          = "${local.example_name}-s3"
  glue_crawler_database_name = aws_glue_catalog_database.database.name  
  glue_crawler_s3_target     = [
    {
      path = "s3://${aws_s3_bucket.data.id}/"
    }
  ]  

  iam_role_policy_statements = [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        aws_s3_bucket.data.arn,
        "${aws_s3_bucket.data.arn}/*"
      ]
    }
  ]

  tags = var.tags
}