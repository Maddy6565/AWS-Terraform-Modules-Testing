variable "ami_id" {
    type =  string
    default = "ami-0e5497a77ef21b5ac"
    description =  "This is the Ubuntu server as default"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "The is default size"
}