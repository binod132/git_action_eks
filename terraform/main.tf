provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}

locals {
  name   = basename(path.cwd)
  region = "us-east-1"
}


module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  bucket = "gitaction"
  version = "3.13.0"
}