resource "aws_iam_role" "container_instance_role" {
  name                = "ecsInstanceRole"
  path                = "/"
  assume_role_policy  = data.aws_iam_policy_document.ecs_iam_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role" {
  role       = aws_iam_role.container_instance_role.name
  policy_arn = var.ecs_instance_role_arn
}