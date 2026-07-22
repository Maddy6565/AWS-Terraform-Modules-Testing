resource "aws_instance" "dev_server" {
    instance_type = var.instance_type
    ami = var.ami_id
    key_name = "demo-key"
    subnet_id = var.subnet_id
    vpc_security_group_ids = [var.security_group_id]
    
    user_data = <<-EOF
    #!/bin/bash
    useradd ${var.username}
    echo "${var.username}:${var.password}" | chpasswd
    EOF 

    tags = var.ec2_tags

}