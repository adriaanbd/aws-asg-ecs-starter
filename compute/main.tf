module "instances" {
  source        = "./instances"
  namespace     = var.namespace
  pub_sub_a_id  = var.pub_sub_a_id
  prv_sub_a_id  = var.prv_sub_a_id
  instance_type = var.instance_type
  key_name      = var.key_name
  bastion_sg_id = var.bastion_sg_id
}
