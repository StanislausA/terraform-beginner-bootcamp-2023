terraform {
  cloud {
    organization = "play-area"

    workspaces {
      name = "terrahouse-1"
    }
  }

  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}

provider "terratowns" {
  endpoint  = var.terratowns_url
  user_uuid = var.user_uuid
  token     = var.terratowns_access_token
}

module "terrahouse_honey" {
  source          = "./modules/terrahouse_aws"
  user_uuid       = var.user_uuid
  bucket_name     = "${var.bucket_name}-honey"
  main_directory  = var.honey_directory
  content_version = var.content_version
}

resource "terratowns_home" "honey_home" {
  name            = "Honey! The 8th Wonder of the World!"
  description     = <<EOT
Honey never spoils.
Archaeologists have found pots of honey over 3,000 years old and still perfectly edible.
Honey's natural composition allow it to last indefinitely under the right conditions.
EOT
  domain_name     = module.terrahouse_honey.cloudfront_distribution_endpoint
  town            = var.food_town_name
  content_version = var.content_version
}

module "terrahouse_dota" {
  source          = "./modules/terrahouse_aws"
  user_uuid       = var.user_uuid
  bucket_name     = "${var.bucket_name}-dota"
  main_directory  = var.dota_directory
  content_version = var.content_version
}

resource "terratowns_home" "dota_home" {
  name            = "How to - Dota 2"
  description     = <<EOT
A How-to guide on becoming the best you can be!
EOT
  domain_name     = module.terrahouse_dota.cloudfront_distribution_endpoint
  town            = var.game_town_name
  content_version = var.content_version
}
