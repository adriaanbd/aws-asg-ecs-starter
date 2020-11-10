module "instances" {
  source              = "./instances"
  namespace           = var.namespace
  instance_type       = var.instance_type
  ami_linux_2_id      = module.data.ami_linux_2_id
  ssh_key_name        = var.ssh_key_name
  bastion_sg_id       = var.bastion_sg_id
  app_sg_id           = var.app_sg_id
  pub_sub_ids         = var.pub_sub_ids
}

module "data" {
  source                   = "./data"
  linux_ami_from_ssm_param = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
  ecs_ami_from_ssm_param   = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended"
}

module "autoscaling" {
  source        = "./autoscaling"
  namespace     = var.namespace
  instance_ami  = module.data.ecs_ami
  instance_type = var.instance_type
  instance_prof = var.ecs_instance_profile_arn
  app_sg_id     = var.app_sg_id
  bastion_sg_id = var.bastion_sg_id
  cluster_name  = module.ecs.cluster_name
  prv_sub_ids   = var.prv_sub_ids
}

module "ecs" {
  source               = "./ecs"
  namespace            = var.namespace
  instance_role        = var.ecs_instance_role
  service_role_arn     = var.ecs_service_role_arn
  alb_target_group_arn = var.alb_target_group_arn 
}