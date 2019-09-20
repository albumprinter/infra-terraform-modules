locals {
  tags = merge({
    Domain        = var.tag_domain
    Enviroment    = var.tag_environment
    "Cost Center" = var.tag_cost_center
  }, var.tag_others)

  function_dead_letter_target_name = var.function_dead_letter_target_name != null ? var.function_dead_letter_target_name : "${var.function_name}_dead_letter"

  function_handler   = var.function_handler != null ? var.function_handler : lookup(local.handlers, local.runtime, null)
  function_s3_bucket = var.function_s3_bucket != null ? var.function_s3_bucket : "infra-terraform-modules-lambda-boilerplate"
  function_s3_key    = var.function_s3_key != null ? var.function_s3_key : "${replace(var.function_runtime, "/[0-9]+.*/", "")}/boilerplate.zip"

  runtime = replace(var.function_runtime, "/[0-9]+.*/", "")

  handlers = {
    nodejs     = "index.handler"
    python     = "lambda_function.lambda_handler"
    dotnetcore = "LambdaTest::LambdaTest.LambdaHandler::handleRequest"
  }
}
