/*resource "aws_instance" "web1_pub_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.prod_key.key_name
  subnet_id                   = aws_subnet.web1_pub_sub.id
  associate_public_ip_address = true

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  vpc_security_group_ids = [aws_security_group.prod_pub_sg.id]

  depends_on = [
    aws_key_pair.prod_key,
    aws_subnet.web1_pub_sub,
    aws_security_group.prod_pub_sg
  ]

  tags = {
    Name = "Webserver-1a"
  }
}

resource "aws_instance" "web2_pub_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.prod_key.key_name
  subnet_id                   = aws_subnet.web2_pub_sub.id
  associate_public_ip_address = true

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  vpc_security_group_ids = [aws_security_group.prod_pub_sg.id]

  depends_on = [
    aws_key_pair.prod_key,
    aws_subnet.web2_pub_sub,
    aws_security_group.prod_pub_sg
  ]

  tags = {
    Name = "Webserver-1b"
  }
}

resource "aws_instance" "app1_pub_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.prod_key.key_name
  subnet_id                   = aws_subnet.app1_pri_sub.id
  associate_public_ip_address = false

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  vpc_security_group_ids = [aws_security_group.prod_pri_sg.id]

  depends_on = [
    aws_key_pair.prod_key,
    aws_subnet.app1_pri_sub,
    aws_security_group.prod_pri_sg
  ]

  tags = {
    Name = "Appserver-1a"
  }
}

resource "aws_instance" "app2_sub_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.prod_key.key_name
  subnet_id                   = aws_subnet.app2_pri_sub.id
  associate_public_ip_address = false

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  vpc_security_group_ids = [aws_security_group.prod_pub_sg.id]

  depends_on = [
    aws_key_pair.prod_key,
    aws_subnet.app2_pri_sub,
    aws_security_group.prod_pri_sg
  ]

  tags = {
    Name = "Appserver-1b"
  }
} */