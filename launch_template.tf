resource "aws_launch_template" "web_lt" {
  name_prefix = "web-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.prod_pub_sg.id]

  depends_on = [
    aws_key_pair.prod_key,
    aws_subnet.web1_pub_sub,
    aws_security_group.prod_pub_sg
  ]
  tags = {
    Name = "Web-Template"
  }
}

resource "aws_autoscaling_group" "web_asg_group" {
  #availability_zones = [ "var.a_zone","var.b_zone" ]
  vpc_zone_identifier = [ var.web1_pub_sub_cidr,var.web2_pub_sub_cidr ]
  desired_capacity   = 2
  max_size           = 4
  min_size           = 1

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }
  depends_on = [ 
    aws_vpc.prod-vpc
   ]
}

#Create load balancer
#Testing