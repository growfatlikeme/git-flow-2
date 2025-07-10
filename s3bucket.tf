provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket = "sctp-ce10-tfstate"
    key    = "estee-module3.tfstate" #The name of the file in the bucket
    region = "ap-southeast-1"  
  }
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "growfat-bucket-2"                        #Use a globally unique name
  force_destroy = true 
}