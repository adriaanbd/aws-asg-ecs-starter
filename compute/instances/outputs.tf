output "bastion_a_id" {
  value = aws_instance.bastion_a.id
}

output "app_a_ip" {
  value = aws_instance.bastion_a.public_ip
}