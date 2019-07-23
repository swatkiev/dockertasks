//variable "ami_id" {}

//variable "aws_access_key" {
//    default = "~/.aws/access_key"
//}

//variable "aws_secret_key" {
//    default = "~/.aws/secret_key"
//}

variable "aws_access_key" { }

variable "aws_secret_key" { }

variable "aws_region" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
default = "~/.ssh/itea-devops.pem"
}

variable "PATH_TO_PUBLIC_KEY" {
default = "~/.ssh/itea-devops.pub"
}

variable "INSTANCE_USERNAME" {
default = "ec2-user"
}

variable "key_name" {
default = "itea-devops-ec2"
}

variable "instance_name" {
default = "Itea-DevOps"
}
