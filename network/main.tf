module "vpc" {
  source    = "./vpc"
  main_cidr = var.vpc_cidr
}

module "subnets" {
  source     = "./subnets"
  vpc_id     = var.vpc_id
  pub_cidr_a = var.pub_cidr_a
  prv_cidr_a = var.prv_cidr_a
  az_a       = var.az_a
}

module "routing" {
  source       = "./routing"
  namespace    = var.namespace
  vpc_id       = module.vpc.vpc_id
  pub_sub_a_id = module.subnets.pub_subnet_a_id
  prv_sub_a_id = module.subnets.prv_subnet_a_id
}
