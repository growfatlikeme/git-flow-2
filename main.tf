provider "aws" {
  region = "ap-southeast-1"
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use the version you're currently using
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4" # Latest version as of now
    }
  }
}

terraform {
  backend "s3" {
    bucket = "sctp-ce10-tfstate"
    key    = "growfat-s3-tf-ci.tfstate" #Change this
    region = "ap-southeast-1"
  }
}

data "aws_caller_identity" "current" {}

locals {
  name_prefix = split("/", "${data.aws_caller_identity.current.arn}")[1]
  account_id  = data.aws_caller_identity.current.account_id
}

resource "aws_s3_bucket" "s3_tf" {
  bucket = "growfatfat-s3-tf-bkt"
}


resource "aws_sns_topic" "user_updates" {
  name = "growfatlikeme-user-updates-topic"
}