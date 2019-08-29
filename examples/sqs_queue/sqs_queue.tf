module "sqs_queue" {
  source = "../../modules/sqs_queue"

  tag_domain      = var.tag_domain
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
}

module "sqs_queue_name" {
  source = "../../modules/sqs_queue"

  name = "my_queue"

  tag_domain      = var.tag_domain
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
}

module "sqs_queue_policy" {
  source = "../../modules/sqs_queue"

  policy_statements = [
    {
      "Effect" : "Allow",
      "Principal" : "*",
      "Action" : ["sqs:SendMessage"]
    }
  ]

  tag_domain      = var.tag_domain
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
}

module "sqs_queue_policy_condition" {
  source = "../../modules/sqs_queue"

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

  tag_domain      = var.tag_domain
  tag_environment = var.tag_environment
  tag_cost_center = var.tag_cost_center
}


