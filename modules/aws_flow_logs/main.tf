resource "aws_flow_log" "main" {

  iam_role_arn         = var.iam_role_arn

  log_destination      = var.log_group_arn

  log_destination_type = "cloud-watch-logs"

  traffic_type         = var.traffic_type

  vpc_id               = var.vpc_id
}