variable "vpc_id" {
    type = string
}

variable "cidr_block" {
    type = string
}

varibale "availability_zone" {
    type = string
}

variable "subnet_tags" {
    type = map(string)
    default = {}
}