data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}

output "ami" {
  value = data.aws_ami.example
}

data "aws_instance" "foo" {
  instance_id = "i-01b9d5e02655e631a"

}

output "ser" {
  value = data.aws_instance.foo.public_ip
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "sep02"
    key    = "roboshop-infra/terraform.tfstate"
    region = "us-east-1"
  }
}