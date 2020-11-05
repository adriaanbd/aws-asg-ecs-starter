# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service_definition_parameters.html
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service
resource "aws_ecs_service" "ecs_service" {
  name                               = var.service_name
  # iam_role                         = var.service_role
  cluster                            = aws_ecs_cluster.cluster.id
  deployment_minimum_healthy_percent = 0
  deployment_maximum_percent         = 100
  task_definition                    = aws_ecs_task_definition.task.family
  launch_type                        = "EC2"                      # default
  scheduling_strategy                = "REPLICA"                  # default
  desired_count                      = var.desired_service_count  # required if REPLICA
  deployment_controller {
    type = "ECS" # default
  }
}
