module "ecr_repository" {
  source = "../../../modules/aws/ecr_repository"

  name = "infra-tf-modules-examples-ecr-repository"

  tags = var.tags
}

module "ecr_repository_shared" {
  source = "../../../modules/aws/ecr_repository"

  name                = "infra-tf-modules-examples-shared-ecr-repository"
  aws_organization_id = "o-123456"

  tags = var.tags
}

module "ecr_repository_lifecycle" {
  source = "../../../modules/aws/ecr_repository"

  name                 = "infra-tf-modules-examples-lifecycled-ecr-repository"
  max_number_of_images = 10

  tags = var.tags
}
