locals {
  output_path         = ".builds/${var.name}.zip"
  environment         = var.environment == null ? [] : [var.environment]
  vpc_config          = var.vpc_config == null ? [] : [var.vpc_config]
  dead_letter_config  = var.dead_letter_config == null ? [] : [var.dead_letter_config]
  filename            = var.source_dir != "" ? data.archive_file.this[0].output_path : var.filename
}
