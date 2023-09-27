output "bucket_name" {
  description = "Bucket name for static website"
  value       = module.terrahouse_aws.bucket_name
}

output "s3_website_endpoint" {
  description = "S3 Static Website Endpoint"
  value       = module.terrahouse_aws.s3_website_endpoint
}
