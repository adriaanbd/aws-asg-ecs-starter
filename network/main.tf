module "vpc" {
  source    = "./vpc"
  namespace = var.namespace
  main_cidr = var.vpc_cidr
}

module "subnets" {
  source     = "./subnets"
  namespace = var.namespace
  vpc_id     = module.vpc.vpc_id
  pub_cidr_a = var.pub_cidr_a
  prv_cidr_a = var.prv_cidr_a
  az_a       = var.az_a
  pub_cidr_b = var.pub_cidr_b
  prv_cidr_b = var.prv_cidr_b
  az_b       = var.az_b
}

module "routing" {
  source       = "./routing"
  namespace    = var.namespace
  vpc_id       = module.vpc.vpc_id
  pub_sub_a_id = module.subnets.pub_sub_a_id
  prv_sub_a_id = module.subnets.prv_sub_a_id
  pub_sub_b_id = module.subnets.pub_sub_b_id
  prv_sub_b_id = module.subnets.prv_sub_b_id
}

module "load_balancing" {
  source       = "./load_balancing"
  namespace    = var.namespace
  vpc_id       = module.vpc.vpc_id
  pub_sub_a_id = module.subnets.pub_sub_a_id
  prv_sub_a_id = module.subnets.prv_sub_a_id
  pub_sub_b_id = module.subnets.pub_sub_b_id
  prv_sub_b_id = module.subnets.prv_sub_b_id
  alb_sg_id    = var.alb_sg_id
}
