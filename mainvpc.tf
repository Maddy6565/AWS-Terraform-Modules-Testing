module "vpc" {

  source = "./modules/vpc"

  name = "Demo-vpc-1"

  vpc_cidr = "10.0.0.0/24"

}

module "subnet" {

    source = "./modules/subnet"

    vpc_id = module.vpc.vpc_id

    availability_zone = "us-eat-2"

    cidr_block = 10.0.3.0/24

    subnet_tags = {
      Name = "Demo-security-group"
    }

}

module "ec2" {

    source = "./modules/ec2"

    ec2_tags = {

        Name = "Demo-testing-1"
    }

}