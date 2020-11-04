output "ssh_key_name" {
  value = module.keys.ssh_key_name
}

output "bastion_sg_id" {
  value = module.firewall.bastion_sg_id
}