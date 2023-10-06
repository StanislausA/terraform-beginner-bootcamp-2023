terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}

module "terrahouse_aws" {
  source          = "./modules/terrahouse_aws"
  user_uuid       = var.user_uuid
  bucket_name     = var.bucket_name
  index_file_path = var.index_file_path
  error_file_path = var.error_file_path
  content_version = var.content_version
}

provider "terratowns" {
  endpoint  = var.terratowns_url
  user_uuid = var.user_uuid
  token     = var.terratowns_access_token
}

resource "terratowns_home" "home" {
  name            = "Honey! The 8th Wonder of the World!"
  description     = <<EOT
Honey never spoils.
Archaeologists have found pots of honey over 3,000 years old and still perfectly edible.
Honey's natural composition allow it to last indefinitely under the right conditions.
EOT
  domain_name     = module.terrahouse_aws.cloudfront_distribution_endpoint
  town            = var.town_name
  content_version = var.content_version
}
