data "aws_iam_policy_document" "ecs_and_tasks_policy" {
  version = "2012-10-17"
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ecs.amazonaws.com", "ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task_role" {
    name = "ecsTaskRole"
    path = "/"
    assume_role_policy = data.aws_iam_policy_document.ecs_and_tasks_policy.json
}


data "aws_iam_policy_document" "ecs_task_role_policy" {
  statement {
    sid    = "AllowEcrReadAccess"
    effect = "Allow"
    actions = ["ecs:DescribeClusters"]
    resources = [var.ecs_cluster_arn]
  }
}

resource "aws_iam_role_policy" "task_role_policy" {
  role   = aws_iam_role.ecs_task_role.name
  policy = data.aws_iam_policy_document.ecs_task_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_attchmnt" {
  role = aws_iam_role.ecs_task_role.name
  policy_arn = var.ecs_task_role_arn
}
