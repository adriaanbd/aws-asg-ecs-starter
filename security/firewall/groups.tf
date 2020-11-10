resource "aws_security_group" "general_sg" {
  name        = "${var.namespace}-general_sg"
  description = "HTTP, HTTPS and ICMP egress to anywhere"
  vpc_id      = var.vpc_id
  tags = {
    Name        = "${var.namespace}-general_sg"
    Environemnt = "dev"
  }
}

resource "aws_security_group" "bastion_sg" {
  name        = var.bastion_sg
  description = "SSH ingress to Bastion and SSH egress to App"
  vpc_id      = var.vpc_id
  tags = {
    Name        = "${var.namespace}-${var.bastion_sg}"
    Environemnt = "dev"
  }
}

resource "aws_security_group" "app_sg" {
  name        = var.app_sg
  description = "SSH ingress from Bastion and all TCP traffic ingress from ALB Security Group"
  vpc_id      = var.vpc_id
  tags = {
    Name        = "${var.namespace}-${var.app_sg}"
    Environemnt = "dev"
  }
}

resource "aws_security_group" "alb_sg" {
  name        = var.alb_sg
  description = "Allows HTTP ingress from anywhere and TCP egress to App"
  vpc_id      = var.vpc_id
  tags = {
    Name        = "${var.namespace}-${var.alb_sg}"
    Environemnt = "dev"
  }
}