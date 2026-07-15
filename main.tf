resource "aws_instance" "dev_server" {
    instance_type = var.instance_type
    ami = var.ami_id
    key_name = "demo-key"

    tags = {
        Name = "test1"
        Project = "demo"
    }
}