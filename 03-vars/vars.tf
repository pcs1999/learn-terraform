variable "sample" {
  default = "hyderabad"
}

output "location" {
  value = var.sample
}

#data types
# 1. string 2.number 3.boolean

#string data types
variable "sample1" {
  default = "chandra"
}

#number data type
variable "sample2" {
  default = 100
}

#boolean data type
variable "sample3" {
  default = true
}

#terraform doesn't support yes/no

#variable types 1.default 2.map 3.list

#default variable type
variable "sample4" {
   default = "pcs"
 }

# list variable type
variable "sample5" {
  default = [
   "hello",
    1000,
    true
  ]
}

# map variable type
variable "sample6" {
  default = {
    number = 100
    string = "hello"

    boolean = true
  }
}

# accessing the list variable
output "sample5" {
  value = var.sample5[0]
}

# accessing the map variable
output "sample6" {
  value = var.sample6["string"]
}

#input
variable "chandra" {}