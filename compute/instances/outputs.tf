output "bastion_a_ip" {
  value = aws_instance.bastion_a.public_ip
}

output "app_a_ip" {
  value = aws_instance.app_a.private_ip
}
