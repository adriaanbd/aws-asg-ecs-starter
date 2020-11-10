resource "aws_route_table" "prv_rt" {
  vpc_id = var.vpc_id

  count = length(var.prv_sub_ids)

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.*.id[count.index]
  }

  tags = {
    Name        = "${var.namespace}-priv_rt_${count.index + 1}"
    Environment = "dev"
  }
}

resource "aws_route_table_association" "prv_rt_assoc" {
  count          = length(var.prv_sub_ids)

  subnet_id      = var.prv_sub_ids[count.index]
  route_table_id = aws_route_table.prv_rt.*.id[count.index]
}
