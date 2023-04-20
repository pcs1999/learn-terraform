variable "sample" {
  default = "hyderabad"
}

output "location" {
  value = var.sample
}