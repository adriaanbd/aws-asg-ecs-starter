module "network" {
  source    = "./network"
  namespace = "${var.namespace}-network"
}