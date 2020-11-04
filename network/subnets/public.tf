resource "aws_subnet" "pub_sub_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.pub_cidr_a
  availability_zone       = var.az_a
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.namespace}-pub-sub-a"
    Environment = "dev"
  }
}