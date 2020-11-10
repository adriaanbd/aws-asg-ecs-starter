resource "aws_subnet" "prv_sub" {
  vpc_id                  = var.vpc_id
  map_public_ip_on_launch = true

  count                   = var.subnets_per_vpc

  cidr_block              = var.prv_sub_cidrs[count.index]
  availability_zone       = var.azs[count.index]

  tags = {
    Name        = "${var.namespace}-prv-sub-${count.index + 1}"
    Environment = "dev"
  }
}