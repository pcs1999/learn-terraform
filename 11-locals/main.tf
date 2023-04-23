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

locals {
  instance_type = {for k, v in var.component : k=> v.instance_type}
  name = {for k, v in var.component : k=> v.name}

}
output "instance_type" {
  value = local.instance_type
}