resource "aws_eip" "prod_ngw_eip" {
  vpc = true
}

resource "aws_internet_gateway" "prod_igw" {
  vpc_id = aws_vpc.prod-vpc.id

  depends_on = [aws_vpc.prod-vpc]

  tags = {
    Name = "prod_igw"
  }
}

resource "aws_nat_gateway" "prod_ngw" {
  allocation_id = aws_eip.prod_ngw_eip.id
  subnet_id     = aws_subnet.web1_pub_sub.id

  depends_on = [
    aws_subnet.web1_pub_sub,
    aws_internet_gateway.prod_igw
  ]

  tags = {
    Name = "prod_ngw"
  }
}

