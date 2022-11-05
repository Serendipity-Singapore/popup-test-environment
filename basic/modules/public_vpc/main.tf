resource "aws_vpc" "basic_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = var.vpc_name_tag
  }
}

module "vpc_security_group" {
  source = "../vpc_security_group"
  vpc_id = aws_vpc.basic_vpc.id
  security_group_name = "default_vpc_security_group"
}