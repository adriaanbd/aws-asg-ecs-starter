data "aws_iam_policy_document" "build_role_policy" {
  version = "2012-10-17"
  statement {
    sid     = "CodeBuildAccessPrincipal"
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "build_role" {
  name               = "${var.name}-build-role"
  assume_role_policy = data.aws_iam_policy_document.build_role_policy.json
}

resource "aws_iam_role_policy" "build_policy" {
  role   = aws_iam_role.build_role.name
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Resource": "*",
        "Action": [
            "ecr:CreateRepository",
            "ecr:BatchCheckLayerAvailability",
            "ecr:CompleteLayerUpload",
            "ecr:GetAuthorizationToken",
            "ecr:InitiateLayerUpload",
            "ecr:PutImage",
            "ecr:UploadLayerPart",
            "ecr:*"
        ]
      },
      {
        "Sid": "AllowECSDescribeTaskDefinition",
        "Effect": "Allow",
        "Action": ["ecs:DescribeTaskDefinition"],
        "Resource": ["*"]
      },
      {
        "Sid": "AllowLogging"
        "Effect": "Allow",
        "Resource": ["*"],
        "Action": [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
      },
      {
        "Effect": "Allow",
        "Resource": [
          var.dockerhub_params.username.arn,
          var.dockerhub_params.password.arn
        ],
        "Action": [
          "ssm:GetParameter",
          "ssm:GetParameters"
        ]
      },
      {
        "Effect":"Allow",
        "Action": [
          "s3:*",
        ],
        "Resource": [
          var.pipeline_bucket_arn,
          "${var.pipeline_bucket_arn}/*"
        ]
      },
      {
        "Effect": "Allow",
        "Resource": [
          "arn:aws:kms:us-east-1:731831150224:key/685cb920-d931-43f1-85dc-d5a98f82aca6"
        ],
        "Action": [
          "kms:Decrypt",
          "kms:GenerateDataKey",
          "kms:Encrypt",
          "kms:ReEncrypt"
        ]
      }
    ]
  })
}