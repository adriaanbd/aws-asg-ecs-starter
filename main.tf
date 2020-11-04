module "network" {
  source    = "./network"
  namespace = "${var.namespace}-network"
}

module "compute" {
  source        = "./compute"
  namespace     = "${var.namespace}-compute"
  pub_sub_a_id  = module.network.pub_sub_a_id
  prv_sub_a_id  = module.network.prv_sub_a_id
  instance_type = "t2.micro"
  ssh_key_name  = module.security.ssh_key_name
  strict_sg_id  = module.security.strict_sg_id
}

module "security" {
  source       = "./security"
  namespace    = var.namespace
  vpc_id       = module.network.vpc_id
  ssh_key_name = var.ssh_key_name
}