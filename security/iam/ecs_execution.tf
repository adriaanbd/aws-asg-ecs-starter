resource "aws_iam_role" "ecs_execution_role" {
  name = "ecsExecutionRole"
  path = "/"
  assume_role_policy = data.aws_iam_policy_document.ecs_and_tasks_policy.json
}

data "aws_iam_policy_document" "ecs_execution_role_policy" {
  statement {
    sid    = "AllowECRPull"
    effect = "Allow"
    actions = [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability"
    ]
    resources = [var.ecr_repo_arn]
  }
  statement {
    sid    = "AllowECRAuth"
    effect = "Allow"
    actions = ["ecr:GetAuthorizationToken"]
    resources = ["*"]
  }
  statement {
    sid    = "AllowLogging"
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "ecs_execution_role_policy" {
  role   = aws_iam_role.ecs_execution_role.name
  policy = data.aws_iam_policy_document.ecs_execution_role_policy.json
}