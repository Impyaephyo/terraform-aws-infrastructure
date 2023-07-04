output "vpc_id" {
  value = aws_vpc.prod-vpc.id
}

output "web1public_subnet_id" {
  value = aws_subnet.web1_pub_sub
}

output "web2public_subnet_id" {
  value = aws_subnet.web2_pub_sub
}

output "app1private_subnet_id" {
  value = aws_subnet.app1_pri_sub
}

output "app2private_subnet_id" {
  value = aws_subnet.app2_pri_sub
}

output "aws_launch_template" {
  value = aws_launch_template.web_lt
}

output "aws_autoscaling_group" {
  value = aws_autoscaling_group.web_asg_group
}