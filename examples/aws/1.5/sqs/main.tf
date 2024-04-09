module "sqs" {
  source = "../../../../modules/aws/sqs"

  queue_name                  = "${var.project_name}Sqs"
  policy = templatefile("${path.module}/templates/queue_policy.json", {})

  tags = var.tags
}
