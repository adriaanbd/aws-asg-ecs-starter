resource "aws_lb" "alb" {
  name               = "aws-starter-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = [var.prv_sub_a_id, var.prv_sub_b_id]
  ip_address_type    = "ipv4"

  tags = {
    Name = "${var.namespace}-alb"
  }
}