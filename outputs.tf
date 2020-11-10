output "ssh_key_path" {
  value = module.security.ssh_key_path
}

output "bastion_ips" {
  value = module.compute.bastion_ips
}

output "alb_dns" {
  description = "The DNS name of the load balancer."
  value       = module.network.alb_dns_name
}

output "pub_sub_ids" {
  value = module.network.pub_sub_ids
}

output "prv_sub_ids" {
  value = module.network.prv_sub_ids
}