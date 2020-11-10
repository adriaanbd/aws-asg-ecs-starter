resource "aws_subnet" "pub_sub" {
  count                   = var.subnets_per_vpc
  vpc_id                  = var.vpc_id
  cidr_block              = var.pub_sub_cidrs[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.namespace}-pub-sub-${count.index + 1}"
    Environment = "dev"
  }
}