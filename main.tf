module "network" {
  source        = "./network"
  namespace     = "${var.namespace}-network"
  pub_sub_cidrs = var.pub_sub_cidrs
  prv_sub_cidrs = var.prv_sub_cidrs
  alb_sg_id     = module.security.alb_sg_id
}

module "compute" {
  source                   = "./compute"
  namespace                = "${var.namespace}-compute"
  instance_type            = "t2.micro"
  ssh_key_name             = var.ssh_key_name
  bastion_sg_id            = module.security.bastion_sg_id
  app_sg_id                = module.security.app_sg_id
  ecs_instance_profile_arn = module.security.ecs_instance_profile_arn
  ecs_instance_role        = module.security.ecs_instance_role
  ecs_service_role_arn     = module.security.ecs_service_role_arn
  alb_target_group_arn     = module.network.alb_target_group_arn
  pub_sub_ids              = module.network.pub_sub_ids
  prv_sub_ids              = module.network.prv_sub_ids
}

module "security" {
  source        = "./security"
  namespace     = var.namespace
  vpc_id        = module.network.vpc_id
  ssh_key_name  = var.ssh_key_name
  os_username   = var.os_username_for_ssh_key
}