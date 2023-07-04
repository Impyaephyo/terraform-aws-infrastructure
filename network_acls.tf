resource "aws_network_acl" "prod_pub_nacl" {
  vpc_id     = aws_vpc.prod-vpc.id
  subnet_ids = [aws_subnet.web1_pub_sub.id]

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  depends_on = [
    aws_vpc.prod-vpc,
    aws_subnet.web1_pub_sub,
  ]

  tags = {
    Name = "prod_pub_nacl"
  }
}

resource "aws_network_acl" "app1_pri_sub_pri_nacl" {
  vpc_id     = aws_vpc.prod-vpc.id
  subnet_ids = [aws_subnet.app1_pri_sub.id]

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_vpc.prod-vpc.cidr_block
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  depends_on = [
    aws_vpc.prod-vpc,
    aws_subnet.app1_pri_sub,
  ]

  tags = {
    Name = "prod_pri_nacl"
  }
}
