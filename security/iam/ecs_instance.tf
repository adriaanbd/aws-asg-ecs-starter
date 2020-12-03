data "aws_iam_policy_document" "ecs_instance_policy" {
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

# https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html
resource "aws_iam_role" "container_instance_role" {
  name                = "ecsInstanceRole"
  path                = "/"
  assume_role_policy  = data.aws_iam_policy_document.ecs_instance_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role_attchmnt" {
  role       = aws_iam_role.container_instance_role.name
  policy_arn = var.ecs_instance_role_arn
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecsInstanceRole"
  role = aws_iam_role.container_instance_role.name
}

