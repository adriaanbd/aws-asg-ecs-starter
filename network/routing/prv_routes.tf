######################
###     TABLES    ###
#####################

resource "aws_route_table" "priv_rt_a" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw_a.id
  }

  tags = {
    Name        = "${var.namespace}-priv_rt_a"
    Environment = "dev"
  }
}

####################
### ASSOCIATIONS ###
####################

resource "aws_route_table_association" "priv_rt_assoc_a" {
  subnet_id      = var.prv_sub_a_id
  route_table_id = aws_route_table.priv_rt_a.id
}