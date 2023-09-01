

resource "aws_instance" "firstec2" {
  ami = data.aws_ami.example.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name= "automachine"
  }
}

output "tf_instance_details" {
  value = aws_instance.firstec2
}

