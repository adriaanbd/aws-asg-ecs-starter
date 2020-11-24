# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html
resource "aws_ecs_task_definition" "task" {
  family                   = var.task_name
  requires_compatibilities = ["EC2"]
  container_definitions    = jsonencode([{
    "name"= "aws-starter-container",
    "image"= "${var.ecr_repo_url}:latest",
    "memory"= 300,
    "portMappings"= [
      {
        "containerPort"= 80
      }
    ]
  }])
}