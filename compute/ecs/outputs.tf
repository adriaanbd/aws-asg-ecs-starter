output "cluster_name" {
  value = aws_ecs_cluster.cluster.name
}

output "cluster_arn" {
  value = aws_ecs_cluster.cluster.arn
}

output "service_name" {
  value = aws_ecs_service.ecs_service.name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.task.arn
}

output "task_definition_family" {
  value = aws_ecs_task_definition.task.family
}

output "container_name" {
  value = var.container_name
}
