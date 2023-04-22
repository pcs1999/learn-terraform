resource "aws_instance" "firstec2" {
  count = length(var.component)
  ami = data.aws_ami.example.id
  instance_type = "t2.micro"
  tags = {
    Name= var.component[count.index]
  }
}
data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}

variable "component" {
  default = ["cart", "catalogue"]
}

output "publicip" {
  value = aws_instance.firstec2.*.public_ip
}