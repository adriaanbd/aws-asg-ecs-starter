data "aws_iam_policy_document" "deploy_role_policy" {
  version = "2012-10-17"
  statement {
    sid     = "CodeDeployAccessPrincipal"
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["codedeploy.amazonaws.com", "ecs-tasks.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "deploy_role" {
  name               = "${var.name}-deploy-role"
  assume_role_policy = data.aws_iam_policy_document.deploy_role_policy.json
}

resource "aws_iam_role_policy" "codedeploy_policy" {
  name = "codedeploy_policy"
  role = aws_iam_role.deploy_role.id
  policy = jsonencode(
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "ecs:DescribeServices",
          "ecs:CreateTaskSet",
          "ecs:UpdateServicePrimaryTaskSet",
          "ecs:DeleteTaskSet",
          "ecr:*",
          "elasticloadbalancing:DescribeTargetGroups",
          "elasticloadbalancing:DescribeListeners",
          "elasticloadbalancing:ModifyListener",
          "elasticloadbalancing:DescribeRules",
          "elasticloadbalancing:ModifyRule",
          "cloudwatch:DescribeAlarms",
          "sns:Publish",
          "s3:*"
          # "s3:GetObject",
          # "s3:GetObjectVersion"
        ],
        "Resource": "*",
        "Effect": "Allow"
      },
      {
        "Action": [
          "iam:PassRole"
        ],
        "Effect": "Allow",
        "Resource": "*",
        # "Condition": {
        #   "StringLike": {
        #     "iam:PassedToService": [
        #       "ecs-tasks.amazonaws.com"
        #     ]
        #   }
        # }
      }
    ]
  })
}

#     actions = ["iam:PassRole"]

#     resources = [
#         aws_iam_role.ecsExecutionRole.arn,
#         aws_iam_role.ecsTaskRole.arn,
#         var.ecsServiceArn,
#         aws_iam_role.codeDeployServiceRole.arn
#     ]
# }