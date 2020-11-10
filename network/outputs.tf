output "vpc_id" {
  value = module.vpc.vpc_id
}

output "pub_sub_ids" {
  value = module.subnets.pub_sub_ids
}

output "prv_sub_ids" {
  value = module.subnets.prv_sub_ids
}

output "alb_target_group_arn" {
  value = module.load_balancing.alb_target_group_arn
}

output "alb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = module.load_balancing.alb_dns_name
}

output "available_azs" {
  value = module.subnets.available_azs
}

output "pub_sub_cidrs" {
  value = module.subnets.pub_sub_cidrs
}

output "prv_sub_cidrs" {
  value = module.subnets.prv_sub_cidrs
}

output "ddbb_sub_cidrs" {
  value = module.subnets.ddbb_sub_cidrs
}