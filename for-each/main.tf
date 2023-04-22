resource "aws_instance" "firstec2" {
  for_each = var.component
  ami = data.aws_ami.example.id
  instance_type = each.value.instance_type
  tags = {
    Name= each.value["name"]
  }
}
data "aws_ami" "example" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}

variable "component" {
  default = {
    cart ={
      name= "cart"
      instance_type= "t3.micro"
    }
    catalogue ={
      name= "catalogue"
      instance_type= "t2.micro"
    }
  }
}


output "publicip" {
  value = aws_instance.firstec2.*.public_ip
}