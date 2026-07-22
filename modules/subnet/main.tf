resource "aws_subnet" "dev_subnet" {
    vpc_id = var.vpc_id
    cidr_block = var.cidr_block
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true

    tags = var.subnet_tags
}