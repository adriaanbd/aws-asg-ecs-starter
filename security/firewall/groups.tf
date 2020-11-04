###########################
###   SECURITY GROUPS   ###
###########################

resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "The Security Group of the Bastion Host"
  vpc_id      = var.vpc_id
  tags = {
    Name        = "${var.namespace}-bastion_sg_a"
    Environemnt = "dev"
  }
}
