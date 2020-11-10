resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.namespace}-igw"
    Environment = "dev"
  }
}

resource "aws_nat_gateway" "ngw" {
  count = length(var.pub_sub_ids)

  allocation_id = aws_eip.nat_eip.*.id[count.index]
  subnet_id     = var.pub_sub_ids[count.index]

  tags = {
    Name = "${var.namespace}-ngw-${count.index}"
    Env  = "dev"
  }
}
