locals {
  index_file = reverse(split("/", var.index_file_path))[0]
  error_file = reverse(split("/", var.error_file_path))[0]
  s3_origin_id = "s3-origin-id-${aws_s3_bucket.website_bucket.bucket}"
}