provider "aws" {
    region = "us-east-1"
}

data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}

resource "aws_instance" "web" {
  ami           = data.aws_ami.Centos.id
  instance_type = "t3.micro"

  tags = {
    Name = "workstation1"
  }
}