locals {
  index_file_name = "index.html"
  error_file_name = "error.html"
  index_file_path = "${path.root}/${var.main_directory}/${local.index_file_name}"
  error_file_path = "${path.root}/${var.main_directory}/${local.error_file_name}"
  s3_origin_id = "s3-origin-id-${aws_s3_bucket.website_bucket.bucket}"
}