resource "aws_security_group" "dev_sg" {

  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  ingress {

    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = var.security_group_tags

}