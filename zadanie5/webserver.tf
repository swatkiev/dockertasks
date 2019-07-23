resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.PATH_TO_PUBLIC_KEY)}"
}

resource "aws_instance" "webserver" {
  ami           = "ami-0b898040803850657"
  instance_type = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.instance_profile.name}"
  key_name = "${aws_key_pair.auth.id}"
  vpc_security_group_ids=[
	"${aws_security_group.ssh-icmp.id}",
	"${aws_security_group.http-https.id}",
	"${aws_security_group.out.id}"
  ]

  tags = {
    Name = "${var.instance_name}"
  }

  provisioner "file" {
    source="files/"
    destination="/tmp"

    connection {
        user="${var.INSTANCE_USERNAME}"
        private_key="${file("${var.PATH_TO_PRIVATE_KEY}")}"
        agent = false
    }
  }

  provisioner "remote-exec" {
    inline = [
	"sudo yum update -y",
	"sudo amazon-linux-extras install nginx1.12 -y",
#	"sudo yum install nginx",
	"sudo chmod +x /tmp/copy.sh",
	"sudo /tmp/copy.sh",
	"sudo service nginx restart",
    ]

    connection {
	user="${var.INSTANCE_USERNAME}"
	private_key="${file("${var.PATH_TO_PRIVATE_KEY}")}"
	agent = false
    }
  }

}
