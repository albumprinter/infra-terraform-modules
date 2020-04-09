locals {
  function_dead_letter_target_name = var.function_dead_letter_target_name != null ? var.function_dead_letter_target_name : "${var.function_name}_dead_letter"

  function_handler   = var.function_handler != null ? var.function_handler : lookup(local.handlers, local.runtime, null)
  function_s3_bucket = var.function_s3_bucket == null && var.function_filename == null ? "infra-terraform-modules-lambda-boilerplate" : var.function_s3_bucket
  function_s3_key    = var.function_s3_key == null && var.function_filename == null ? "${replace(var.function_runtime, "/[0-9]+.*/", "")}/boilerplate.zip" : var.function_s3_key

  runtime = replace(var.function_runtime, "/[0-9]+.*/", "")

  handlers = {
    nodejs     = "index.handler"
    python     = "lambda_function.lambda_handler"
    dotnetcore = "LambdaTest::LambdaTest.LambdaHandler::handleRequest"
  }
}
