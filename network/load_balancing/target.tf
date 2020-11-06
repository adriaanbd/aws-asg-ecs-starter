# Amazon ECS handles target registration ###
resource "aws_lb_target_group" "target" {
  name        = "aws-starter-alb-target"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
  depends_on = [aws_lb.alb]
}
