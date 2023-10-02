terraform {
  #  cloud {
  #    organization = var.tfc_organization
  #
  #    workspaces {
  #      name = var.tfc_workspace
  #    }
  #  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

# https://developer.hashicorp.com/terraform/plugin/framework/data-sources
data "aws_caller_identity" "current_user" {}
