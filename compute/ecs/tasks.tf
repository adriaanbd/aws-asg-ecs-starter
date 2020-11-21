# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html
resource "aws_ecs_task_definition" "task" {
  family                   = var.task_name
  requires_compatibilities = ["EC2"]
  container_definitions    = file("${path.module}/container_def.json")
}