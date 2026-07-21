module "vpc" {

  source = "./modules/vpc"

  name = "Demo-vpc-1"

  vpc_cidr = "10.0.0.0/24"

}

module "subnet" {

    source = "./modules/subnet"

    vpc_id = module.vpc.vpc_id

    availability_zone = "us-east-2a"

    cidr_block = "10.0.0.0/24"

    subnet_tags = {
      Name = "Demo-subnet-1"
    }

}

module "ec2" {

    source = "./modules/ec2"

    instance_type = "t3.small"

    ami_id = "ami-0daff962b1c050d36"

    ec2_tags = {

        Name = "Demo-testing-1"
    }

}