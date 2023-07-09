resource "aws_security_group" "prod_pub_sg" {
  name        = "prod_pub_sg"
  description = "allow http, https and ssh"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  depends_on = [aws_vpc.prod-vpc]

  tags = {
    Name = "prod_pub_sg"
  }
}

resource "aws_security_group" "prod_pri_sg" {
  name        = "prod_pri_sg"
  description = "allow mysql"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.prod-vpc.cidr_block]
  }

  ingress {
    description = "allow mysql"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.prod-vpc.cidr_block]
  }

  ingress {
    description = "allow mysql"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.prod-vpc.cidr_block]
  }

  ingress {
    description = "allow icmp"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [aws_vpc.prod-vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  depends_on = [aws_vpc.prod-vpc]

  tags = {
    Name = "prod_pri_sg"
  }
}

resource "aws_security_group" "prod_lb_sg" {
  name        = "prod_lb_sg"
  description = "allow http, https"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  depends_on = [aws_vpc.prod-vpc]

  tags = {
    Name = "prod_lb_sg"
  }
}

resource "aws_security_group" "prodapp_lb_sg" {
  name        = "prod_applb_sg"
  description = "allow http, https"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.20.0.0/16"]
  }

  ingress {
    description = "allow https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.20.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "all"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  depends_on = [aws_vpc.prod-vpc]

  tags = {
    Name = "prodapp_lb_sg"
  }
}