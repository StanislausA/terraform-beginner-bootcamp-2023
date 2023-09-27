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
    suffix = local.index_file
  }

  error_document {
    key = local.error_file
  }
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
resource "aws_s3_object" "website_index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = local.index_file
  source = "${path.root}/${var.index_file_path}"
  etag   = filemd5("${path.root}/${var.index_file_path}")
}

resource "aws_s3_object" "website_error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = local.index_file
  source = "${path.root}/${var.error_file_path}"
  etag   = filemd5("${path.root}/${var.error_file_path}")
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.website_bucket.bucket
    policy = data.aws_iam_policy_document.allow_access_from_another_account.json
#  policy = jsonencode({
#    "Version" = "2012-10-17",
#    "Statement" = {
#      "Sid"    = "AllowCloudFrontServicePrincipalReadOnly",
#      "Effect" = "Allow",
#      "Principal" = {
#        "Service" = "cloudfront.amazonaws.com"
#      },
#      "Action"   = "s3:GetObject",
#      "Resource" = "arn:aws:s3:::${aws_s3_bucket.website_bucket.bucket}/*",
#      "Condition" = {
#        "StringEquals" = {
#          # "AWS:SourceArn" = "arn:aws:cloudfront::${data.aws_caller_identity.current_user.account_id}:distribution/${aws_cloudfront_distribution.s3_distribution.id}"
#          "AWS:SourceArn" = aws_cloudfront_distribution.s3_distribution.arn
#        }
#      }
#    }
#  })
}
# TESTING, condition may be faulty
data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = ["s3:GetObject"]

    resources = ["arn:aws:s3:::${aws_s3_bucket.website_bucket.bucket}/*"]

    condition {
      test     = "StringEquals"
      values   = [aws_cloudfront_distribution.s3_distribution.arn]
      variable = aws_cloudfront_distribution.s3_distribution.arn
    }
  }
}
