###########################
###   SECURITY GROUPS   ###
###########################

resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "A Security Group allowing to SSH ingress, HTTP egress and Ping egress"
  vpc_id      = var.vpc_id
  tags = {
    Name        = "${var.namespace}-bastion_sg"
    Environemnt = "dev"
  }
}

resource "aws_security_group" "app_sg" {
  name        = "app_sg"
  description = "A Security Group allowing to SSH ingress from Bastion Host, HTTP egress and Ping egress"
  vpc_id      = var.vpc_id
  tags = {
    Name        = "${var.namespace}-app_sg"
    Environemnt = "dev"
  }
}