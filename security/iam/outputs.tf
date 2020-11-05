output "ecs_instance_profile_arn" {
  value = aws_iam_instance_profile.ecs_instance_profile.arn
}

output "ecs_service_role" {
  value = aws_iam_role.container_instance_role.name
}