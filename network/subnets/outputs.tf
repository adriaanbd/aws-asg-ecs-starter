output "pub_sub_ids" {
  value = aws_subnet.pub_sub.*.id
}

output "prv_sub_ids" {
  value = aws_subnet.prv_sub.*.id
}