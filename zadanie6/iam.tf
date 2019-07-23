resource "aws_iam_role" "instance-role" {
  name = "${var.instance_role_name}"

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
    Name = "My-role"
  }
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.instance_profile_name}"
  role = "${aws_iam_role.instance-role.name}"
}

resource "aws_iam_role_policy_attachment" "policy_atachment" {
   role       = "${aws_iam_role.instance-role.name}"
   policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
