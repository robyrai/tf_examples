# Terraform
# Optional configuration for the Terraform Engine.
terraform {
  required_version = ">=1.0.0"
}

# Provider
# Implement cloud specific API and Terraform API.
# Provider configuration is specific to each provider.
# Providers expose Data Sources and Resources to Terraform
provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key"

  # Many providers also accept configuration via environment variables
  # or config files. The AWS provider will read the standard AWS CLI
  # settings if they are present
}

# Resources
# Objects managed by Terraform such as VMS OR S3 BUCKETS.
# Declaring a Resource tells Terraform that it should CREATE
# and manage the Resource described. If the Resource already exists
# its must be imported into Terraform's state.
resource "aws_s3_bucket" "bucket1" {
bucket = "bucket1"
}

# Data Sources
# Objects NOT managed by Terraform.

data "aws_caller_identity" "current" {

}

data "aws_availability_zones" "available" {

}

output "bucket_info" {
  value = aws_s3_bucket.bucket1.bucket
}

output "aws_caller_info" {
  value = data.aws_caller_identity.current
}

output "aws_availability_zones" {
  value = data.aws_availability_zones.available
}
