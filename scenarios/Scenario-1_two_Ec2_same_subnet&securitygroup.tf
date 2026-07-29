module "vpc" {

  source = "../modules/vpc"

  name = "Demo-vpc-1"

  vpc_cidr = "10.0.0.0/24"

}

module "subnet" {

  source = "../modules/subnet"

  vpc_id = module.vpc.vpc_id

  availability_zone = "us-east-2a"

  cidr_block = "10.0.0.16/28"

  subnet_tags = {
    Name = "Demo-subnet-1"
  }

}


module "igw" {

  source = "../modules/igw"

  vpc_id = module.vpc.vpc_id

  igw_tags = {

    Name = "Demo-igw-1"

  }

}

module "route_table" {

  source = "../modules/route-table"

  vpc_id = module.vpc.vpc_id

  igw_id = module.igw.igw_id

  route_table_tags = {
    Name = "Demo-route-table-1"
  }
}

module "aws_route_table_association" {

  source = "../modules/route-table-association"

  subnet_id = module.subnet.subnet_id

  route_table_id = module.route_table.route_table_id
}

module "security_group" {

  source = "../modules/security-group"

  vpc_id = module.vpc.vpc_id

  security_group_name        = "Demo-security-group-1"
  security_group_description = "Security Group for EC2"

  security_group_tags = {
    Name = "Demo-security-group-1"
  }

}

module "ec2_a" {

  source = "../modules/ec2"

  instance_type = "t3.small"

  subnet_id = module.subnet.subnet_id

  security_group_id = module.security_group.security_group_id

  username = "manideep"

  password = "Qwerty@123"

  ec2_tags = {

    Name = "Demo-testing-1"
  }

}

module "ec2_b" {

  source = "../modules/ec2"

  instance_type = "t3.micro"

  subnet_id = module.subnet.subnet_id

  security_group_id = module.security_group.security_group_id

  username = "manish"

  password = "Qwerty@123"

  ec2_tags = {

    Name = "Demo-testing-2"
  }

}

module "cloudwatch" {

  source = "../modules/cloudwatch"

  log_group_name = "/aws/vpc/Demo-vpc"


  retention_in_days = "60"

  log_group_tags = {

    Name = "Demo-VPC-logs"

  }

}

module "iam-role" {

  source = "../modules/iam-role"

  role_name = "Demo-VPC-Flow-Logs-role"

  service_name = "vpc-flow-logs.amazonaws.com"

  role_tags = {
    Name = "Demo-VPC-Flow-Logs-role"
  }
}

module "iam-policy" {

  source = "../modules/iam-policy"

  policy_name = "Demo-VPC-FlowLogs-Policy"

  policy_document = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"

        ]

        Resource = "*"

      }

    ]

  })

}

module "iam-role-policy-attachment" {

  source = "../modules/iam-role-policy-attachment"

  role_name = module.iam-role.role_name

  policy_arn = module.iam-policy.policy_arn

}

module "vpc-flow-log" {

  source = "../modules/vpc-flow-log"

  vpc_id = module.vpc.vpc_id

  iam_role_arn = module.iam-role.role_arn

  log_group_arn = module.cloudwatch.log_group_arn

  traffic_type = "ALL"

}
