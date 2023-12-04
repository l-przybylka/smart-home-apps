
resource "aws_vpc" "main" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.public_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_cidr[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  count                   = length(var.private_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_cidr[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = false
}
