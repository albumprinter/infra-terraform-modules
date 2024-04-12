module "ecr_repository" {
  source = "../../../../modules/aws/ecr_repository"
  name                  = "${var.project_name}EcrRepository"
  organization_id                  = "${var.organization_id}"
  tags = var.tags
}
