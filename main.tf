provider "aws" {
  region = "ap-southeast-1"
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0" # Use the version you're currently using
    }
  }
}

terraform {
  required_version = ">= 1.9.0"
}

terraform {
  backend "s3" {
    bucket = "sctp-ce10-tfstate"
    key    = "growfat-s3-tf-ci.tfstate" #Change this
    region = "ap-southeast-1"
  }
}



resource "aws_s3_bucket" "s3_tf" {
  #checkov:skip=CKV2_AWS_6: "Ensure that S3 bucket has a Public Access block"
  #checkov:skip=CKV_AWS_145: "Ensure that S3 buckets are encrypted with KMS by default"
  #checkov:skip=CKV2_AWS_62: "Ensure S3 buckets should have event notifications enabled"
  #checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
  #checkov:skip=CKV_AWS_144: "Ensure that S3 bucket has cross-region replication enabled"
  #checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  #checkov:skip=CKV2_AWS_61: "Ensure that an S3 bucket has a lifecycle configuration"
  bucket = "growfatfat-s3-tf-bkt"
}


resource "aws_sns_topic" "user_updates" {
  #checkov:skip=CKV_AWS_26: "AWS SNS topic has SSE disabled"
  name = "growfatlikeme-user-updates-topic"
}