terraform {
  #  cloud {
  #    organization = var.tfc_organization
  #
  #    workspaces {
  #      name = var.tfc_workspace
  #    }
  #  }
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
