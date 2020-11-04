output "ssh_key_name" {
  value = module.keys.ssh_key_name
}

output "strict_sg_id" {
  value = module.firewall.strict_sg_id
}