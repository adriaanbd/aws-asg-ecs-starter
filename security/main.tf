module "firewall" {
  source    = "./firewall"
  namespace = var.namespace
  vpc_id    = var.vpc_id
}

module "keys" {
  source       = "./keys"
  ssh_key_name = var.ssh_key_name
}

module "iam" {
  source       = "./iam"
}