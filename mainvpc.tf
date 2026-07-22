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

module "route_table" {

  source = "./modules/route-table"

  vpc_id = module.vpc.vpc_id

  igw_id = module.igw.igw_id

  route_table_tags = {
    Name = "Demo-route-table-1"
  }
}

module "aws_route_table_association" {

  source = "./modules/route-table-association"

  subnet_id = module.subnet.subnet_id

  route_table_id = module.route_table.route_table_id
}

module "ec2" {

  source = "./modules/ec2"

  instance_type = "t3.small"

  subnet_id = module.subnet.subnet_id

  username = "manideep"

  password = "Qwerty@123"

  ec2_tags = {

    Name = "Demo-testing-1"
  }

}
