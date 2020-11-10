resource "aws_subnet" "prv_sub" {
  count                   = var.subnets_per_vpc
  vpc_id                  = var.vpc_id
  cidr_block              = var.prv_sub_cidrs[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.namespace}-prv-sub-${count.index + 1}"
    Environment = "dev"
  }
}