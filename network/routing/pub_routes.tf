resource "aws_route_table" "pub_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  count = length(var.pub_sub_ids)

  tags = {
    Name        = "${var.namespace}-pub_rt_${count.index + 1}"
    Environment = "dev"
  }
}

resource "aws_route_table_association" "rt_assoc" {
  count          = length(var.pub_sub_ids)

  subnet_id      = var.pub_sub_ids[count.index]
  route_table_id = aws_route_table.pub_rt.*.id[count.index]
}
