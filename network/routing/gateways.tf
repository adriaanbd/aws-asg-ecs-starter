###########################
###   INTERNET GATEWAY  ###
###########################

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.namespace}-igw"
    Environment = "dev"
  }
}

#######################
###   NAT GATEWAY   ###
#######################


resource "aws_nat_gateway" "ngw_a" {
  allocation_id = aws_eip.nat_eip_a.id
  subnet_id     = var.pub_sub_a_id
  tags = {
    Name = "${var.namespace}-ngw-a"
    Env  = "dev"
  }
}

resource "aws_nat_gateway" "ngw_b" {
  allocation_id = aws_eip.nat_eip_b.id
  subnet_id     = var.pub_sub_b_id
  tags = {
    Name = "${var.namespace}-ngw-b"
    Env  = "dev"
  }
}

#######################
#######   EIP   #######
#######################

resource "aws_eip" "nat_eip_a" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = "${var.namespace}-nat-eip-a"
  }
}

resource "aws_eip" "nat_eip_b" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = "${var.namespace}-nat-eip-b"
  }
}