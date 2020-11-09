output "alb_target_group_arn" {
  value = aws_lb_target_group.client.arn
}

output "alb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = aws_lb.alb.dns_name
}