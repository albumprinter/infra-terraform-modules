resource "aws_s3_bucket" "data" {
  bucket = local.example_name

  tags = var.tags
}

resource "aws_glue_catalog_database" "database" {
  name = local.example_name
}