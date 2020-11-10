output "pub_sub_ids" {
  value = aws_subnet.pub_sub.*.id
}

output "prv_sub_ids" {
  value = aws_subnet.prv_sub.*.id
}

output "available_azs" {
  value = var.azs
}

output "pub_sub_cidrs" {
  value  = var.pub_sub_cidrs
}

output "prv_sub_cidrs" {
  value  = var.prv_sub_cidrs
}

output "ddbb_sub_cidrs" {
  value  = var.ddbb_sub_cidrs
}