output "bastion_ips" {
  value = module.instances.bastion_ips
}

output "ecs_service_name" {
  value = module.ecs.service_name
}

output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}
