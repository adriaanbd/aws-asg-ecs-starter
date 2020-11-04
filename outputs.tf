output "vpc_id" {
  description = "The ID of the Main VPC"
  value       = module.network.vpc_id
}

output "bastion_a_ip" {
  description = "The Public IP of the Instance A"
  value       = module.compute.bastion_a_ip
}

output "ssh_key_name" {
  value = module.security.ssh_key_name
}