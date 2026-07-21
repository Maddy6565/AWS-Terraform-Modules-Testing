variable "vpc_id" {
    type = string
}

variable "route_table_tags" {
    type = map(string)
    default = {}
}