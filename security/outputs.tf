output "ssh_key_name" {
  value = module.keys.ssh_key_name
}

output "ssh_key_path" {
  value = module.keys.ssh_key_path
}

output "ecs_instance_profile_arn" {
  value = module.iam.ecs_instance_profile_arn
}

output "ecs_service_role_arn" {
  value = module.iam.ecs_service_role_arn
}

output "ecs_instance_role" {
  value = module.iam.ecs_instance_role
}

output "bastion_sg_id" {
  value = module.firewall.bastion_sg_id
}

output "app_sg_id" {
  value = module.firewall.app_sg_id
}

output "alb_sg_id" {
  value = module.firewall.alb_sg_id
}