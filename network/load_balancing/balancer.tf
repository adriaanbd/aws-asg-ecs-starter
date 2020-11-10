resource "aws_lb" "alb" {
  name               = "aws-starter-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = var.pub_sub_ids
  ip_address_type    = "ipv4"

  tags = {
    Name = "${var.namespace}-alb"
  }
}