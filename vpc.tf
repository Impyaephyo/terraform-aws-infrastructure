resource "aws_vpc" "prod-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "prod-vpc"
  }
}

resource "aws_subnet" "web1_pub_sub" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.web1_pub_sub_cidr
  availability_zone = var.a_zone

  depends_on = [aws_vpc.prod-vpc]

  tags = {
    Name = "web1_pub_sub"
  }
}

resource "aws_subnet" "web2_pub_sub" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.web2_pub_sub_cidr
  availability_zone = var.b_zone

  depends_on = [aws_vpc.prod-vpc]

  tags = {
    Name = "web2_pub_sub"
  }
}

resource "aws_subnet" "app1_pri_sub" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.app1_sub_cidr
  availability_zone = var.a_zone

  depends_on = [aws_vpc.prod-vpc]

  tags = {
    Name = "app1_pri_sub"
  }
}

resource "aws_subnet" "app2_pri_sub" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.app2_sub_cidr
  availability_zone = var.b_zone

  depends_on = [aws_vpc.prod-vpc]

  tags = {
    Name = "app2_pri_sub"
  }
}

resource "aws_subnet" "db_pri_sub" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.db_sub_cidr
  availability_zone = var.a_zone

  depends_on = [aws_vpc.prod-vpc]

  tags = {
    Name = "db_pri_sub"
  }
}