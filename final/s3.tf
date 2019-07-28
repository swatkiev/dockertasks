resource "aws_s3_bucket" "itea-devops" {
  bucket = "final-zadanie"
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
    key    = "zadanie8/terraform.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}

