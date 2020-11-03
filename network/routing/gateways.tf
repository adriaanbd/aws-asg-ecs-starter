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
  subnet_id     = aws_subnet.pub_subnet_a.id
  tags = {
    Name = "${var.namespace}-ngw-a"
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