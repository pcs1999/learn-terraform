
resource "aws_instance" "firstec2" {
  ami = data.aws_ami.example.id
  instance_type = var.type== "null" ? "t3.micro" :var.type

  tags = {
    Name= "automachine"
  }
}

data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}

variable "type" {
  default = "null"
}