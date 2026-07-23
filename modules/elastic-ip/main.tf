resource "aws_eip" "eip" {

  domain = "vpc"

  tags = var.elastic_ip_tags

}