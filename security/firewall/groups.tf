###########################
###   SECURITY GROUPS   ###
###########################

resource "aws_security_group" "strict_sg" {
  name        = "strict_sg"
  description = "A Security Group allowing to SSH ingress, HTTP egress and Ping egress"
  vpc_id      = var.vpc_id
  tags = {
    Name        = "${var.namespace}-strict_sg_a"
    Environemnt = "dev"
  }
}
