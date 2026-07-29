variable "vpc_id" {
  type = string
}

variable "iam_role_arn" {
  type = string
}

variable "log_group_arn" {
  type = string
}

variable "traffic_type" {
  type    = string
  default = "ALL"
}