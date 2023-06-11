provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}

locals {
  name   = basename(path.cwd)
  region = "us-east-1"
}

variable "bucket_name" {
 default = "gitaction"
}

module "aws_s3_bucket" {
 source  = "terraform-aws-modules/s3-bucket/aws"
 version = "2.14.1"
 bucket  = var.bucket_name
}