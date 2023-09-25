terraform {
#  cloud {
#    organization = var.tfc_organization
#
#    workspaces {
#      name = var.tfc_workspace
#    }
#  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "random" {}

provider "aws" {}
