output "ecs_instance_profile_arn" {
  value = aws_iam_instance_profile.ecs_instance_profile.arn
}

output "ecs_instance_role" {
  value = aws_iam_role.container_instance_role.name
}

output "ecs_service_role_arn" {
  value = aws_iam_role.ecs_service_role.arn
}

output "ecs_execution_role_arn" {
  value = aws_iam_role.ecs_execution_role.arn
}