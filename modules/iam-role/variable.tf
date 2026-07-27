variable "role_name" {
  type = string
}

variable "service_name" {
    type = string 
}

variable "role_tags" {
  type    = map(string)
  default = {}
}