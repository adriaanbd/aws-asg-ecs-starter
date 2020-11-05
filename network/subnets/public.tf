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

resource "aws_subnet" "pub_sub_b" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.pub_cidr_b
  availability_zone       = var.az_b
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.namespace}-pub-sub-b"
    Environment = "dev"
  }
}