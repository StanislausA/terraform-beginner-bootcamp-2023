variable "user_uuid" {
  description = "UUID of the user"
  type        = string

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.user_uuid))
    error_message = "The user_uuid value is not a valid UUID."
  }
}

variable "bucket_name" {
  description = "Name of bucket"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9.-]{3,63}$", var.bucket_name))
    error_message = "Invalid AWS S3 bucket name."
  }
}

variable "main_directory" {
  description = "Directory path containing web content files."
  type = string
}

variable "content_version" {
  description = "Current content version number"
  type = number

  validation {
    condition = var.content_version > 0
    error_message = "The content version must be a positive integer."
  }
}
