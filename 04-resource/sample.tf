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

terraform {
  backend "s3" {
    bucket = "terraform-19feb"
    key    = "apirl/terraform.tf"
    region = "us-east-1"
  }
}
