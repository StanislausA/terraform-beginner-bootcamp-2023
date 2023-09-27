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

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "website_bucket" {
  # Bucket Naming Rules => https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration
resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
resource "aws_s3_object" "website_index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = reverse(split("/", var.index_file))[0]
  source = "${path.root}/${var.index_file}"
  etag   = filemd5("${path.root}/${var.index_file}")
}

resource "aws_s3_object" "website_error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = reverse(split("/", var.error_file))[0]
  source = "${path.root}/${var.error_file}"
  etag   = filemd5("${path.root}/${var.error_file}")
}
