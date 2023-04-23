resource "aws_instance" "firstec2" {
  ami = data.aws_ami.example.id
  instance_type = var.instance_type

  tags = {
    Name= var.name
  }
}

data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}

variable "instance_type" {}

variable "name" {}

#take aways
# always iterate modules not resources
# always map the data and use for_each_loop
# count is not completely useless ,it is for resource level from root module side