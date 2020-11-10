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

output "available_azs" {
  value = module.network.available_azs
}

output "pub_sub_cidrs" {
  value  = module.network.pub_sub_cidrs
}

output "prv_sub_cidrs" {
  value  = module.network.prv_sub_cidrs
}

output "ddbb_sub_cidrs" {
  value = module.network.ddbb_sub_cidrs
}