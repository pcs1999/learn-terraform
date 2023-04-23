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
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name= "automachine"
  }

}

resource "null_resource" "provision" {

  provisioner "local-exec" {
    connection {
      host = aws_instance.firstec2.public_ip
      user = "centos"
      password = "DevOps321"
    }

    inline= ["false"]
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"


  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}