# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service_definition_parameters.html
resource "aws_ecs_service" "ecs_service" {
  name                               = var.service_name
  iam_role                           = var.service_role_arn       # this is for Load Balancing
  cluster                            = aws_ecs_cluster.cluster.id
  deployment_minimum_healthy_percent = 0
  deployment_maximum_percent         = 200
  task_definition                    = aws_ecs_task_definition.task.family
  launch_type                        = "EC2"                      # default
  scheduling_strategy                = "REPLICA"                  # default
  desired_count                      = var.desired_service_count  # required if REPLICA
  deployment_controller {
    type = "ECS"                                                  # default
  }

### Amazon ECS handles target registration ###
  load_balancer {
    target_group_arn  = var.alb_target_group_arn
    container_name    = "httpd"
    container_port    = 80
  }         
}
