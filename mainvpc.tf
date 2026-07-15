module "vpc" {

  source = "./modules/vpc"

  name = "terraform-demo-vpc"

  vpc_cidr = "10.0.0.0/24"

}
module "ec2" {

    source = "./modules/ec2"

    ec2_tags = {

        Name = "Demo-testing"
    }

}