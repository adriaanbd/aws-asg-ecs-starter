output "vpc_id" {
  description = "The ID of the Main VPC"
  value       = module.vpc.vpc_id
}

output "pub_sub_a_id" {
  description = "The ID of the Public Subnet A"
  value       = module.subnets.pub_sub_a_id
}

output "prv_sub_a_id" {
  description = "The ID of the Subnet of App A"
  value       = module.subnets.prv_sub_a_id
}