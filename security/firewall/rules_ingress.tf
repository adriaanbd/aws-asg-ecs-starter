resource "aws_security_group_rule" "in_ssh_bastion_from_anywhere" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion_sg.id
}

resource "aws_security_group_rule" "in_tcp_bastion_from_anywhere" {
  type              = "ingress"
  description       = "WARNING: Allow all TCP ingress traffic"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion_sg.id
}

resource "aws_security_group_rule" "in_ssh_app_from_bastion" {
  type                     = "ingress"
  description              = "Allow SSH from a Bastion Security Group"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.app_sg.id
  source_security_group_id = aws_security_group.bastion_sg.id
}

resource "aws_security_group_rule" "in_http_alb_from_anywhere" {
  type              = "ingress"
  description       = "Allow HTTP ingress internet traffic for ALB"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "in_tcp_app_from_alb" {
  type                     = "ingress"
  description              = "Allow all TCP ingress from ALB"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "all"
  security_group_id        = aws_security_group.app_sg.id
  source_security_group_id = aws_security_group.alb_sg.id
}