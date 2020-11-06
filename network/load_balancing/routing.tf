# Amazon ECS handles target registration ###
resource "aws_lb_target_group" "client" {
  name        = "aws-starter-alb-target"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
  depends_on = [aws_lb.alb]

  health_check {
    enabled             = true            # default
    interval            = "30"            # default is 5
    path                = "/"             # required
    port                = "traffic-port"  # default
    protocol            = "HTTP"          # default
    timeout             = "60"            # default is 5 for instance
    healthy_threshold   = "5"             # default
    unhealthy_threshold = "2"             # default is 3
    matcher             = "200"           # required
  }
}

resource "aws_lb_listener" "client_fwd" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.client.arn
  }
}
