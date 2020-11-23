# Amazon ECS handles target registration ###
resource "aws_lb_target_group" "blue" {
  name        = "aws-starter-alb-target-blue"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
  depends_on  = [aws_lb.alb]
}

resource "aws_lb_target_group" "green" {
  name        = "aws-starter-alb-target-green"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
  depends_on  = [aws_lb.alb]
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.label == "blue" ? aws_lb_target_group.blue.arn : aws_lb_target_group.green.arn
  }
}
