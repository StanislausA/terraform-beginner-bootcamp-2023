output "bucket_name" {
  description = "Bucket name for static website"
  value       = module.terrahouse_aws.bucket_name
}

output "s3_website_endpoint" {
  description = "S3 Static Website Endpoint"
  value       = module.terrahouse_aws.s3_website_endpoint
}

output "cloudfront_distribution_endpoint" {
  description = "CloudFront Distribution Endpoint"
  value = module.terrahouse_aws.cloudfront_distribution_endpoint
}
