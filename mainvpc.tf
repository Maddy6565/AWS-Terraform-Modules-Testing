module "vpc" {

  source = "./modules/vpc"

  name = "terraform-demo-vpc"

  vpc_cidr = "10.0.0.0/24"

}