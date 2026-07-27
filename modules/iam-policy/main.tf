resource "aws_iam_policy" "policy_name" {
    
    name = var.policy_name

    role = var.role_name
    
    policy = jsondecode ({
        
        "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:DescribeLogGroups",
                "logs:DescribeLogStreams"
            ],
            "Resource": "*"
        }
    ]
    })
}