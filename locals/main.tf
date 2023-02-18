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
  abc = {for k, v in var.components : k=> v.abc }
}

output "instance_type" {
  value = local.instance_type
}

output "abc" {
  value = local.abc
}