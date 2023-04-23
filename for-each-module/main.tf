
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





module "ec2" {
  source = "./module"
  for_each = var.component
  instance_type = each.value.instance_type
  name= each.value.name
}