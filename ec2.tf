provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA2XMPBQFUBZ6KZ3X6"
  secret_key = "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"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["737423753576"]
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags {
    Name = "HelloWorld"
  }
}

