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
    suffix = local.index_file_name
  }

  error_document {
    key = local.error_file_name
  }
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
resource "aws_s3_object" "website_index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = local.index_file_name
  content_type = "text/html"
  source = local.index_file_path
  etag   = filemd5(local.index_file_path)

  lifecycle {
    ignore_changes = [etag]
    replace_triggered_by = [terraform_data.content_version.output]
  }
}

resource "aws_s3_object" "website_assets" {
  for_each = fileset("${var.main_directory}/assets","*.{jpg,png,gif}")
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "assets/${each.key}"
  source = "${var.main_directory}/assets/${each.key}"
  etag = filemd5("${var.main_directory}/assets/${each.key}")

  lifecycle {
    replace_triggered_by = [terraform_data.content_version.output]
    ignore_changes = [etag]
  }
}

resource "aws_s3_object" "website_error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = local.error_file_name
  content_type = "text/html"
  source = "${local.error_file_path}"
  etag   = filemd5("${local.error_file_path}")

  lifecycle {
    ignore_changes = [etag]
    replace_triggered_by = [terraform_data.content_version.output]
  }
}

# https://developer.hashicorp.com/terraform/language/resources/terraform-data
resource "terraform_data" "content_version" {
  input = var.content_version
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.website_bucket.bucket
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document
data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    sid    = "AllowCloudFrontServicePrincipalReadOnly"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = ["${aws_s3_bucket.website_bucket.arn}/*"]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.s3_distribution.arn]
    }
  }
}
