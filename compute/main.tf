module "instances" {
  source         = "./instances"
  namespace      = var.namespace
  pub_sub_a_id   = var.pub_sub_a_id
  prv_sub_a_id   = var.prv_sub_a_id
  instance_type  = var.instance_type
  ami_linux_2_id = module.data.ami_linux_2_id
  ssh_key_name   = var.ssh_key_name
  bastion_sg_id  = var.bastion_sg_id
}

module "data" {
  source             = "./data"
  ami_ssm_param_name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
