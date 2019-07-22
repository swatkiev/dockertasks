resource "aws_instance" "web" {
  instance_type = "t2.micro"

  # Specify our ubuntu ami
  ami = "${var.ubuntu_ami}"

  key_name = "${var.key_name}"

  count=1


  # We run a remote provisioner on the instance after creating it.
  # In this case, we just install nginx and start it. By default,
  # this should be on port 80
  user_data = "${file("userdata.sh")}"
}

resource "aws_security_group" "asg-sg" {
  name   = "ClusterSecurityGroup"
  vpc_id = "vpc-4f0a6735"
  ingress {
    from_port         = 80
    to_port           = 80
    protocol          = "TCP"
    cidr_blocks       = ["0.0.0.0/0"]
  }
  egress {
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
  }
}

resource "aws_iam_role" "s3-read-only" {
  name = "s3-read-only"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "tag-value"
  }
}

