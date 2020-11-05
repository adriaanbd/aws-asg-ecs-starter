output "bastion_a_ip" {
  value = module.instances.bastion_a_ip
}

output "app_a_ip" {
  value = module.instances.app_a_ip
}

output "ecs_launch_config" {
  value = module.ecs.launch_config
}