output "bastion_a_ip" {
  value = aws_instance.bastion_a.public_ip
}

output "bastion_b_ip" {
  value = aws_instance.bastion_b.private_ip
}
