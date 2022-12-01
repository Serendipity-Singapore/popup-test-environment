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

