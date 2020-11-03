resource "aws_vpc" "main" {
  cidr_block           = var.main_cidr
  enable_dns_support   = true # defaults to true
  enable_dns_hostnames = true # defaults to false

  tags = {
    Name        = "${var.namespace}-vpc"
    Environment = "dev"
  }
}