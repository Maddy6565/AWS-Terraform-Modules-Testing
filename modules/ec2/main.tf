resource "aws_instance" "dev_server" {
    instance_type = var.instance_type
    ami = var.ami_id
    key_name = "demo-key"
    
    
    user_data = <<-EOF
    #!/bin/bash
    useradd ${var.username}
    echo "${var.username}:${var.password}" | chpasswd
    EOF 

    tags = var.ec2_tags

}