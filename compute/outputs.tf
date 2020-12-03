output "bastion_ips" {
  value = module.instances.bastion_ips
}

output "ecs_service_name" {
  value = module.ecs.service_name
}

output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}

output "ecs_cluster_arn" {
  value = module.ecs.cluster_arn
}

output "task_definition_arn" {
  value = module.ecs.task_definition_arn
}

output "task_definition_family" {
  value = module.ecs.task_definition_family
}
