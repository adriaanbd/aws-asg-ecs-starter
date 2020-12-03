data "aws_iam_policy_document" "pipeline_role_policy" {
  version = "2012-10-17"
  statement {
    sid     = "CodePipelineAccessPrincipal"
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "pipeline_role" {
  name               = "${var.name}-pipeline-role"
  assume_role_policy = data.aws_iam_policy_document.pipeline_role_policy.json
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "codepipeline_policy"
  role = aws_iam_role.pipeline_role.id
  policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
      "Effect": "Allow",
      "Resource": [
        "${data.aws_codecommit_repository.app.arn}"
      ],
      "Action": [
          "codecommit:GitPull",
          "codecommit:GetRepository",
          "codecommit:GetBranch",
          "codecommit:GetCommit",
          "codecommit:UploadArchive",
          "codecommit:GetUploadArchiveStatus",
          "codecommit:CancelUploadArchive"
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
        "${aws_s3_bucket.pipeline_bucket.arn}",
        "${aws_s3_bucket.pipeline_bucket.arn}/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:BatchGetBuilds",
        "codebuild:StartBuild"
      ],
      "Resource": "*"
    },
    {
    "Effect": "Allow",
    "Action": [
      "codedeploy:CreateDeployment",
      "codedeploy:GetDeployment",
      "codedeploy:GetApplication",
      "codedeploy:GetApplicationRevision",
      "codedeploy:RegisterApplicationRevision",
      "codedeploy:GetDeploymentConfig",
      "ecs:RegisterTaskDefinition",
      "ecr:DescribeImages",
      "iam:PassRole",
      "ecr:*",
      "ec2:*",
      "elasticloadbalancing:*",
      "autoscaling:*",
      "cloudwatch:*",
      "s3:*",
      "sns:*",
      "ecs:*"
    ],
    "Resource": "*"
    }
  ]
}
EOF
}

# why?
# statement {
#     sid    = "AllowECS"
#     effect = "Allow"

#     actions = ["ecs:*"]

#     resources = ["*"]
# }

# why so open?
# statement {
#   sid    = "AllowResources"
#   effect = "Allow"

  # actions = [
  #   "ec2:*",
  #   "elasticloadbalancing:*",
  #   "autoscaling:*",
  #   "cloudwatch:*",
  #   "s3:*",
  #   "sns:*",
  #   "ecs:*",
  #   "iam:PassRole"
  # ]

#   resources = ["*"]
# }