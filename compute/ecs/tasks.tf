# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html
resource "aws_ecs_task_definition" "task" {
  family                   = var.task_name
  container_definitions    = file("${path.module}/container_def.json")
  requires_compatibilities = ["EC2"]
}