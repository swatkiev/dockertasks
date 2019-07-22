// Provider for users with access and secret keys
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

//provider "random" {
//}

//terraform {
//  backend "s3" {}
//}

resource "aws_s3_bucket" "itea-devops" {
  bucket = "itea-devops-s3"
  acl    = "private"

  tags = {
    Name        = "itea-devops"
    Environment = "Dev"
  }
}

data "terraform_remote_state" "store_tf_state" {
  backend = "s3"

 config {
    bucket = "${aws_s3_bucket.itea-devops.bucket}"
    key    = "zadanie5/terraform.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}

