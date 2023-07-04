resource "aws_route_table" "prod_pub_rt" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_igw.id
  }

  depends_on = [aws_vpc.prod-vpc, aws_internet_gateway.prod_igw]

  tags = {
    Name = "prod_pub_rt"
  }
}

resource "aws_route_table" "prod_pri_rt" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.prod_ngw.id
  }

  depends_on = [aws_vpc.prod-vpc, aws_nat_gateway.prod_ngw]

  tags = {
    Name = "prod_pri_rt"
  }
}

resource "aws_route_table_association" "pub1" {
  subnet_id      = aws_subnet.web1_pub_sub.id
  route_table_id = aws_route_table.prod_pub_rt.id
}

resource "aws_route_table_association" "pub2" {
  subnet_id      = aws_subnet.web2_pub_sub.id
  route_table_id = aws_route_table.prod_pub_rt.id
}

resource "aws_route_table_association" "pri1" {
  subnet_id      = aws_subnet.app1_pri_sub.id
  route_table_id = aws_route_table.prod_pri_rt.id
}

resource "aws_route_table_association" "pri2" {
  subnet_id      = aws_subnet.app2_pri_sub.id
  route_table_id = aws_route_table.prod_pri_rt.id
}