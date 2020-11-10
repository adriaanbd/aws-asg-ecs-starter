output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

output "app_sg_id" {
  value = aws_security_group.app_sg.id
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "general_sg_id" {
  value = aws_security_group.general_sg.id
}