variable "components" {

    default = {
        cart= {
            name = "cart",
            instance_type = "t3.micro"
        }

        catalogue = {
            name = "catalogue",
            instance_type = "t3.micro"

        }
    }
  
}

locals {
  instance_type = {for k, v in var.components : k=> v.instance_type }
  instance_type1 = {for k, v in var.components : k=> v.instance_type1 }
}

output "instance_type" {
  value = local.instance_type
}

output "instance_type1" {
  value = local.instance_type1
}