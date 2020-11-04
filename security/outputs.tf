output "ssh_key_name" {
  value = module.keys.ssh_key_name
}

output "ssh_key_path" {
  value = module.keys.ssh_key_path
}

output "bastion_sg_id" {
  value = module.firewall.bastion_sg_id
}

output "app_sg_id" {
  value = module.firewall.app_sg_id
}