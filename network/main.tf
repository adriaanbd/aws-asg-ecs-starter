data "aws_availability_zones" "azs" {
  state = "available"
}

module "vpc" {
  source    = "./vpc"
  namespace = var.namespace
  main_cidr = var.vpc_cidr
}

module "subnets" {
  source     = "./subnets"
  namespace  = var.namespace
  vpc_id     = module.vpc.vpc_id
  azs        = slice(data.aws_availability_zones.zone_ids, 0, var.subnets_per_vpc)
  pub_cidrs  = slice(var.pub_sub_cidrs, 0, var.subnets_per_vpc)
  prv_cidrs  = slice(var.prv_sub_cidrs, 0, var.subnets_per_vpc)
}

module "routing" {
  source      = "./routing"
  namespace   = var.namespace
  vpc_id      = module.vpc.vpc_id
  pub_sub_ids = module.subnets.pub_sub_ids
  prv_sub_ids = module.subnets.prv_sub_ids
}

module "load_balancing" {
  source       = "./load_balancing"
  namespace    = var.namespace
  vpc_id       = module.vpc.vpc_id
  pub_sub_ids  = module.subnets.pub_sub_ids
  alb_sg_id    = var.alb_sg_id
}
