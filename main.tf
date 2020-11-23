module "network" {
  source        = "./network"
  namespace     = "${var.namespace}-network"
  pub_sub_cidrs = var.pub_sub_cidrs
  prv_sub_cidrs = var.prv_sub_cidrs
  alb_sg_id     = module.security.alb_sg_id
  label         = var.bg_label
}

module "compute" {
  source                     = "./compute"
  namespace                  = "${var.namespace}-compute"
  instance_type              = "t2.micro"
  ssh_key_name               = var.ssh_key_name
  bastion_sg_id              = module.security.bastion_sg_id
  app_sg_id                  = module.security.app_sg_id
  general_sg_id              = module.security.general_sg_id
  ecs_instance_profile_arn   = module.security.ecs_instance_profile_arn
  ecs_instance_role          = module.security.ecs_instance_role
  ecs_service_role_arn       = module.security.ecs_service_role_arn
  alb_blue_target_group_arn  = module.network.alb_blue_target_group_arn
  alb_green_target_group_arn = module.network.alb_green_target_group_arn
  pub_sub_ids                = module.network.pub_sub_ids
  prv_sub_ids                = module.network.prv_sub_ids
  ecr_repo_name              = module.cicd.ecr_repo_url
  label                      = var.bg_label
}

module "security" {
  source        = "./security"
  namespace     = var.namespace
  vpc_id        = module.network.vpc_id
  ssh_key_name  = var.ssh_key_name
  os_username   = var.os_username_for_ssh_key
}

module "cicd" {
  source                     = "./cicd"
  name                       = var.namespace
  aws_region                 = var.region
  alb_http_listener_arn      = module.network.alb_http_listener_arn
  blue_lb_target_group_name  = module.network.blue_lb_target_group_name
  green_lb_target_group_name = module.network.green_lb_target_group_name
  ecs_service_name           = module.compute.ecs_service_name
  ecs_cluster_name           = module.compute.ecs_cluster_name
}