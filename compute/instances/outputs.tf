output "bastion_ips" {
  value = aws_instance.bastion.*.public_ip
}
