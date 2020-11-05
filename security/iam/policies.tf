data "aws_iam_policy_document" "ecs_iam_policy" {
  version = "2012-10-17"
  statement {
    sid     = ""
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com", "ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}
