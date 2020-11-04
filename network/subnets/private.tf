resource "aws_subnet" "prv_sub_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.prv_cidr_a
  availability_zone       = var.az_a
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.namespace}-prv-sub-a"
    Environment = "dev"
  }
}