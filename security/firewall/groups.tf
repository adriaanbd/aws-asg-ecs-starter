###########################
###   SECURITY GROUPS   ###
###########################

resource "aws_security_group" "bastion_sg" {
  name        = var.bastion_sg
  description = "A Security Group allowing to SSH ingress, HTTP egress and Ping egress"
  vpc_id      = var.vpc_id
  tags = {
    Name        = "${var.namespace}-${var.bastion_sg}"
    Environemnt = "dev"
  }
}

resource "aws_security_group" "app_sg" {
  name        = var.app_sg
  description = "A Security Group allowing SSH ingress from Bastion Host, HTTP egress for updates, Ping egress and all TCP traffic ingress from ALB Security Group"
  vpc_id      = var.vpc_id
  tags = {
    Name        = "${var.namespace}-${var.app_sg}"
    Environemnt = "dev"
  }
}

resource "aws_security_group" "alb_sg" {
  name        = var.alb_sg
  description = "A Security Group for the App Load Balancers allowing HTTP traffic"
  vpc_id      = var.vpc_id
  tags = {
    Name        = "${var.namespace}-${var.alb_sg}"
    Environemnt = "dev"
  }
}