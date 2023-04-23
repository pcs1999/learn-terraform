provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}

resource "aws_instance" "firstec2" {
  ami = data.aws_ami.example.id
  instance_type = "t2.micro"

  tags = {
    Name= "automachine"
  }

}

resource "null_resource" "provision" {

  provisioner "remote-exec" {
    connection {
      host = aws_instance.firstec2.public_ip
      user = "centos"
      password = "DevOps321"
    }

    inline = [
      "false"
    ]
  }
}

