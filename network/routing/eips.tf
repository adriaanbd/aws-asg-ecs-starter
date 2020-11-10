resource "aws_eip" "nat_eip" {
  count      = length(var.pub_sub_ids)

  vpc        = true
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "${var.namespace}-nat_eip_${count.index}"
  }
}
