resource "aws_security_group_rule" "out_ping" {
  type              = "egress"
  from_port         = 8 # echo request
  to_port           = 0 # echo reply
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.general_sg.id
}

resource "aws_security_group_rule" "out_http" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.general_sg.id
}

resource "aws_security_group_rule" "out_https" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.general_sg.id
}

resource "aws_security_group_rule" "out_ssh_bastion" {
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bastion_sg.id
  source_security_group_id = aws_security_group.app_sg.id
}


resource "aws_security_group_rule" "out_internet_app" {
  type              = "egress"
  description       = "Allow TCP internet traffic egress from app layer"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app_sg.id
}

resource "aws_security_group_rule" "out_internet_alb" {
  type                     = "egress"
  description              = "Allow all TCP traffic to App Layer"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.alb_sg.id
  source_security_group_id = aws_security_group.app_sg.id
}
