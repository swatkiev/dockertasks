resource "aws_security_group" "ssh-icmp" {
  name   = "Allow SSH connections and ICMP replies"
  description = "Allow SSH inbound traffic and ICMP echo replyes"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH and ICMP"
  }
}

resource "aws_security_group" "http-https" {
  name   = "Allow HTTP and HTTPS connections"
  description = "Allow HTTP and HTTPS inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "HTTP and HTTPS"
  }
}

resource "aws_security_group" "out" {
  name   = "Allow connections from instance to any"
  description = "Allow connections from instance to any"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow outgoing connections"
  }
}
