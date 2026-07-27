resource "aws_iam_role" "role_name" {

    name = var.role_name

    assume_role_policy = jsondecode({

        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "Statement1",
                "Effect": "Allow",
                "Principal": {
                    "Service": "vpc-flow-logs.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
    ]
    })

    tags = var.role_tags
}