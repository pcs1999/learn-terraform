module "sg" {
  source = "./sg"
}

module "ec2" {
  source = "./ec2"
  security_group_id = module.sg.sg_out_id
}

terraform {
  backend "s3" {
    bucket = "terraform-19feb"
    key    = "roboshop-infra/fri/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}