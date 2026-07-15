resource "aws_instance" "dev_server" {
    instance_type = "var.instance_type"
    instance_name = "test1"
    ami_id = "var.ami_id"
    key_pair = "demo-key"

    tags = {
        Project = "demo"
    }
}