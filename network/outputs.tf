output "vpc_id" {
  description = "The ID of the Main VPC"
  value       = aws_vpc.main.id
}

output "pub_subnet_a_id" {
  description = "The ID of the Public Subnet A"
  value       = aws_subnet.pub_sub_a.id
}

output "prv_subnet_a_id" {
  description = "The ID of the Subnet of App A"
  value       = aws_subnet.prv_sub_a.id
}