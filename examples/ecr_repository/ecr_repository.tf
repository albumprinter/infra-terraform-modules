module "ecr_repository" {
  source = "../../modules/ecr_repository"

  name = "infra-tf-modules-examples-ecr-repository"

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}

module "ecr_repository_shared" {
  source = "../../modules/ecr_repository"

  name                = "infra-tf-modules-examples-shared-ecr-repository"
  aws_organization_id = "o-123456"

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}

module "ecr_repository_lifecycle" {
  source = "../../modules/ecr_repository"

  name                 = "infra-tf-modules-examples-lifecycled-ecr-repository"
  max_number_of_images = 10

  tag_cost_center = var.tag_cost_center
  tag_environment = var.tag_environment
  tag_domain      = var.tag_domain
}
