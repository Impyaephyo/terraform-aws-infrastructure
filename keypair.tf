resource "aws_key_pair" "prod_key" {
  key_name   = "prod_key"
  public_key = var.prod_pub_key
}