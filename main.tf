terraform {}

module "terrahouse_aws" {
  source      = "./modules/terrahouse_aws"
  user_uuid   = var.user_uuid
  bucket_name = var.bucket_name
  index_file_path  = var.index_file_path
  error_file_path  = var.error_file_path
  content_version = var.content_version
}
