resource "aws_instance" "web" {
    count = 2 
    ami = data.aws_ami.centos8.id
    instance_type = "t3.micro"
    tags = {
        Name = "web-centos"
    
    tags = {
        Name = "web-centos123"

    }
  
}


data "aws_ami" "centos8" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

}

output "publicip" {
    #with loops
    value = aws_instance.web.*.public_ip
    #withoutloops
    #value = aws_instance.web.public_ip
}