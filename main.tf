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

data "aws_caller_identity" "current" {}


resource "aws_s3_bucket" "s3_tf" {
  bucket = "growfatfat-s3-tf-bkt"
}


resource "aws_sns_topic" "user_updates" {
  name = "growfatlikeme-user-updates-topic"
}