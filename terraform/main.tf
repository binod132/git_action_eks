terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  version = "~> 4.0"
  region  = "us-east-1"
}

backend "s3" {
       bucket = "gitacton1"
       key    = "[Remote_State_S3_Bucket_Key]"
       region = "us-east-1"
   }

}

provider "aws" {
  version = "~>3.0"
  region  = "east-us-1"
}

resource "aws_s3_bucket" "s3Bucket" {
     bucket = "gitacton1"
     acl       = "public-read"

     policy  = <<EOF
{
     "id" : "MakePublic",
   "version" : "2012-10-17",
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
         "effect" : "Allow",
         "resource" : "arn:aws:s3:::[BUCKET_NAME_HERE]/*",
         "principal" : "*"
      }
    ]
  }
EOF

   website {
       index_document = "index.html"
   }
}