variable "log_group_name" {
  type = string
}
variable "retention_in_days" {
    type = string
    default = "30"
}
variable "log_group_tags" {
  type = map(string)
  default = {}
}