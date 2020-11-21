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
  policy = <<-EOF
{
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
          "ecr:UploadLayerPart"
      ]
    },
    {
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:us-east-1:${var.aws_account_id}:log-group:/aws/codebuild/${aws_codebuild_project.app.name}",
        "arn:aws:logs:us-east-1:${var.aws_account_id}:log-group:/aws/codebuild/${aws_codebuild_project.app.name}:*"
      ],
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
    },
    {
      "Effect": "Allow",
      "Resource": [
        "${var.dockerhub_params.username.arn}",
        "${var.dockerhub_params.password.arn}"
      ],
      "Action": [
        "ssm:GetParameter",
        "ssm:GetParameters"
      ]
    },
    {
      "Effect":"Allow",
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:PutObject"
      ],
      "Resource": [
        "${var.pipeline_bucket_arn}",
        "${var.pipeline_bucket_arn}/*"
      ]
    },
    {
      "Effect": "Allow",
      "Resource": [
        "${var.ssm_kms_key_arn}"
      ],
      "Action": [
        "kms:Decrypt",
        "kms:GenerateDataKey"
      ]
    }
  ]
}
EOF
}