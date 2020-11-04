output "vpc_id" {
  description = "The ID of the Main VPC"
  value       = module.network.vpc_id
}

output "bastion_a_ip" {
  description = "The Public IP of the Instance A"
  value       = module.compute.public_ip_a
}

output "ssh_key_name" {
  value = module.security.ssh_key_name
}