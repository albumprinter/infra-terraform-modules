module "lambda_sqs" {
  source = "../../../modules/aws/lambda_function_sqs"

  name       = "${var.project_name}LambdaSqs"
  source_dir = "${path.module}/src"

  tags = var.tags
}
