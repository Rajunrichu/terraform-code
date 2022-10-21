terraform {
  required_version = ">=1.0.0"
}

provider "aws" {
  region  = var.aws_region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}