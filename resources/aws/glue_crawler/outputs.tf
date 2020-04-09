output "glue_crawler" {
  value = aws_glue_crawler.crawler
}

output "iam_role" {
  value = module.iam_role.iam_role
}