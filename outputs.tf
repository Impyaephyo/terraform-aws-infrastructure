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

#output "public_ec2_address" {
#  value = aws_instance.prod_pub_ec2.public_ip
#}
