output "role_arn" {
  value = aws_iam_role.role_name.arn
}

output "role_name" {
  value =  aws_iam_role.role_name.name
}