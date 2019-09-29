module "sqs_queue" {
  source = "../../../modules/aws/sqs_queue"

  tags = var.tags
}

module "sqs_queue_name" {
  source = "../../../modules/aws/sqs_queue"

  name = "infra-tf-modules-examples-named-sqs-queue"

  tags = var.tags
}

module "sqs_queue_policy" {
  source = "../../../modules/aws/sqs_queue"

  policy_statements = [
    {
      "Effect" : "Allow",
      "Principal" : "*",
      "Action" : ["sqs:SendMessage"]
    }
  ]

  tags = var.tags
}

module "sqs_queue_policy_condition" {
  source = "../../../modules/aws/sqs_queue"

  policy_statements = [
    {
      "Effect" : "Allow",
      "Action" : ["sqs:SendMessage"],
      "Condition" : {
        "ArnEquals" : {
          "aws:SourceArn" : "arn:aws:lambda:eu-west-1:055974010211:function:EXAMPLE"
        }
      }
    }
  ]

  tags = var.tags
}


