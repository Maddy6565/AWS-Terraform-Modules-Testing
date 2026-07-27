resource "aws_iam_policy" "main" {
    
    name = var.policy_name

    policy = var.policy_document

}