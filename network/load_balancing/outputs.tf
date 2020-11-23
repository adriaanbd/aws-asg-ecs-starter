output "alb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = aws_lb.alb.dns_name
}

output "alb_name" {
  value = aws_lb.alb.name
}

output "alb_http_listener_arn" {
  value = aws_lb_listener.http_listener.arn
}

output "blue_lb_target_group_name" {
  value = aws_lb_target_group.blue.name
}

output "green_lb_target_group_name" {
  value = aws_lb_target_group.green.name
}

output "alb_blue_target_group_arn" {
  value = aws_lb_target_group.blue.arn
}

output "alb_green_target_group_arn" {
  value = aws_lb_target_group.green.arn
}