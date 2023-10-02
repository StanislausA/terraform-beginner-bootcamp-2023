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

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current_user" {}
