output "ssh_key_path" {
  value = module.security.ssh_key_path
}

output "bastion_a_ip" {
  description = "The Public IP of the Instance A"
  value       = module.compute.bastion_a_ip
}

output "alb_dns" {
  description = "The DNS name of the load balancer."
  value       = module.network.alb_dns_name
}