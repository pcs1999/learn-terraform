module "a" {
  source = "./one"
 oranges = module.b.count_of_oranges
}
module "b" {
  source = "./two"
}