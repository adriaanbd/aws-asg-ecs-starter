output "bastion_a_ip" {
  description = "The Public IP of the Instance A"
  value       = module.compute.bastion_a_ip
}

output "app_a_ip" {
  description = "The Public IP of the Instance A"
  value       = module.compute.app_a_ip
}

output "ssh_key_path" {
  value = module.security.ssh_key_path
}

output "ecs_launch_config" {
  value = module.compute.ecs_launch_config
}