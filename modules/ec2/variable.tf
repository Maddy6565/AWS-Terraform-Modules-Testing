variable "ami_id" {
    type =  string
    default = "ami-0e5497a77ef21b5ac"
    description =  "This is the Ubuntu server as default"
}
variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "The is default size"
}
variable "ec2_tags" {

    type = map(string)
    default = {}
}
variable "subnet_id" {
    
    type = string
}
variable "username" {
  type = string
  default = "user123"
  description = "This is default username"
}
variable "password" {
  type = string
  sensitive = true
  default = "Password123"
  description = "This is default password"
}