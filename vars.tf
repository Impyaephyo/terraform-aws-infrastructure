variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "aws_access_key" {
  default = "Key here"
}

variable "aws_secret_key" {
  default = "Key here"
}

variable "vpc_cidr" {
  type    = string
  default = "172.20.0.0/16"
}

variable "web1_pub_sub_cidr" {
  type    = string
  default = "172.20.1.0/24"
}

variable "web2_pub_sub_cidr" {
  type    = string
  default = "172.20.10.0/24"
}

variable "app1_sub_cidr" {
  type    = string
  default = "172.20.2.0/24"
}

variable "app2_sub_cidr" {
  type    = string
  default = "172.20.20.0/24"
}

variable "db_sub_cidr" {
  type    = string
  default = "172.20.3.0/24"
}

variable "a_zone" {
  type    = string
  default = "ap-southeast-1a"
}

variable "b_zone" {
  type    = string
  default = "ap-southeast-1b"
}
/*variable "Web-Server01" {
  type    = string
  default = "Web-Server01"
}
variable "App-Server01" {
  type    = string
  default = "App-Server01"
}
*/
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

#Ubuntu-focal-20.04-amd64-server-20230517
variable "ami_id" {
  type    = string
  default = "ami-002843b0a9e09324a"
}


variable "prod_pub_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFmj6viVZLXNIaiASHTBDigxi2MJNhqG6j7Xjvoa+1WfFWyiIhu9cVlE59wtQzYznvlbgkgwyg7IjIUauuWqRWhyZVuK7nyZPP3/MSvX8ZKaDWjpFJKSHVO9wO/UlGce7YHMyQBUdjkVXGe/GvKwMWd+H0KcisTb96gZgqQQsdDU2cTjqOCHsWstu3rLQUj6UAKA1a95KMnnnHnGN5hPoikKXc11QUmRQPlNhRqLND0aPWCmXS2Sn7rP7zxXVk9ej64w4OjsmEBzO7KT0o4EInUtaCSSzLvIjqrSt3Qy2RZANb7SoI4uupLQjOORUblB723LDErF+Tp1k2Evz2wjBuTaH+RG21OPbymaRzAU738jK51Q0dynEZeGSAa13BPA0EnQEx6kWXWUM/NKkUr0Eeh2tez2YKoCP8FXyrgFF2LNX2qUXcLKN6zg30hgk+sauoCEaBekK8nqhbgGIKD21P0K139nvIxLy//aJcgyeoWmgcYfX1QxJsUtfI9OMCnws= panneikhine@Panns-MBP"
}


