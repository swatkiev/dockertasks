provider "aws" {
//  profile    = "${var.profile_name}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
}

provider "aws" {
  alias = "east"
//  profile    = "${var.profile_name}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
}

provider "random" {
}

terraform {
  backend "s3" {}
}
