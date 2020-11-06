# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service_definition_parameters.html
resource "aws_ecs_service" "ecs_service" {
  name                               = var.service_name
  iam_role                           = var.service_role_arn  # for Load Balancing
  cluster                            = aws_ecs_cluster.cluster.id
  deployment_minimum_healthy_percent = var.min_healthy_percent
  deployment_maximum_percent         = var.max_percent
  task_definition                    = aws_ecs_task_definition.task.family
  launch_type                        = "EC2"
  scheduling_strategy                = "REPLICA"                
  desired_count                      = var.desired_tasks                

  load_balancer {
    target_group_arn  = var.alb_target_group_arn
    container_name    = var.container_name
    container_port    = 80
  }         
}
