#######################
###     TABLES      ###
#######################

resource "aws_route_table" "pub_rt_a" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "${var.namespace}-pub_rt_a"
    Environment = "dev"
  }
}

####################
### ASSOCIATIONS ###
####################

resource "aws_route_table_association" "rt_assoc_a" {
  subnet_id      = var.pub_sub_a_id
  route_table_id = aws_route_table.pub_rt_a.id
}