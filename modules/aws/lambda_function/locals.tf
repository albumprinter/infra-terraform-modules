locals {
  output_path = ".builds/${var.name}.zip"
  environment = var.environment == null ? [] : toset([var.environment])
  vpc_config  = var.vpc_config == null ? [] : toset([var.vpc_config])
}
