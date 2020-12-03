module "firewall" {
  source    = "./firewall"
  namespace = var.namespace
  vpc_id    = var.vpc_id
}

module "keys" {
  source       = "./keys"
  ssh_key_name = var.ssh_key_name
  os_username  = var.os_username
}

module "iam" {
  source          = "./iam"
  ecs_cluster_arn = var.ecs_cluster_arn
  ecr_repo_arn    = var.ecr_repo_arn
}