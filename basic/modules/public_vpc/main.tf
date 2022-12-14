# VPC where all resources are created
resource "aws_vpc" "basic_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = var.vpc_name_tag
  }
}

# 1 Availability Zone
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.basic_vpc.id
  cidr_block = "10.0.1.0/24"
  # AP southeast 1B Out of nanos
  availability_zone = var.subnet_availability_zone
  tags = {
    Name = var.subnet_name_tag
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.basic_vpc.id
  tags = {
    Name = var.igw_name_tag
  }
}

# Basic Security Group To Allow for
module "vpc_security_group" {
  source = "../vpc_security_group"
  vpc_id = aws_vpc.basic_vpc.id
  security_group_name = var.security_group_name
}

resource "aws_route_table" "popup_basic_main_route" {
  vpc_id = aws_vpc.basic_vpc.id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.route_table_name_tag
  }
}

resource "aws_main_route_table_association" "a" {
  vpc_id = aws_vpc.basic_vpc.id
  route_table_id = aws_route_table.popup_basic_main_route.id
}