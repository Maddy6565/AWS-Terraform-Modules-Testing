module "vpc" {

  source = "./modules/vpc"

  name = "Demo-vpc-1"

  vpc_cidr = "10.0.0.0/24"

}

module "subnet" {

  source = "./modules/subnet"

  vpc_id = module.vpc.vpc_id

  availability_zone = "us-east-2a"

  cidr_block = "10.0.0.16/28"

  subnet_tags = {
    Name = "Demo-subnet-1"
  }

}

module "igw" {

  source = "./modules/igw"

  vpc_id = module.vpc.vpc_id

  igw_tags = {

    Name = "Demo-igw-1"

  }

}

module "ec2" {

  source = "./modules/ec2"

  instance_type = "t3.small"

  username = "manideep"

  password = "Qwerty@123"

  ec2_tags = {

    Name = "Demo-testing-1"
  }

}