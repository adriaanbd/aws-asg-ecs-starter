output "vpc_id" {
  value = module.vpc.vpc_id
}

output "pub_sub_a_id" {
  value = module.subnets.pub_sub_a_id
}

output "prv_sub_a_id" {
  value = module.subnets.prv_sub_a_id
}

output "pub_sub_b_id" {
  value = module.subnets.pub_sub_b_id
}

output "prv_sub_b_id" {
  value = module.subnets.prv_sub_b_id
}

output "alb_target_group_arn" {
  value = module.load_balancing.alb_target_group_arn
}