module "network" {
  source    = "./network"
  namespace = "${var.namespace}-network"
}

module "compute" {
  source        = "./compute"
  namespace     = "${var.namespace}-compute"
  pub_sub_a_id  = module.network.pub_subnet_a_id
  prv_sub_a_id  = module.network.prv_subnet_a_id
  instance_type = "t2.micro"
  ssh_key_name  = module.security.key_name
  bastion_sg_id = module.security.bastion_sg_id
}
