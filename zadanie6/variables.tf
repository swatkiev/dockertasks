variable "ami_id" {
   default = "ami-0b898040803850657"
}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
    default = "us-east-1"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "~/.ssh/itea-devops.pub"
}

variable "key_name" {
    default = "itea-devops-key"
}

variable "instance_name" {
    default = "itea-devops-asg"
}

variable "VPCId" {
   default = "vpc-4f0a6735"
}

variable "subnet_ids" { 
    type = "list"
    default  = ["subnet-113adb5c", "subnet-43a3f11f"]
 }

variable "instance_role_name" {
    default = "s3-read-only-itea2"
}

variable "instance_profile_name" {
    default = "s3-readonly-new-instance-profile"
}
