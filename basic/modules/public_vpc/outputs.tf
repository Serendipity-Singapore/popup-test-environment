output "vpc_info" {

  value= {
    id = aws_vpc.basic_vpc.id
    arn = aws_vpc.basic_vpc.arn
    public_subnet_id = aws_subnet.public_subnet.id
  }
}

output vpc_id {
  value =  aws_vpc.basic_vpc.id
}

output vpc_arn {
  value =  aws_vpc.basic_vpc.arn
}

output vpc_public_subnet_id {
  value =  aws_subnet.public_subnet.id
}

output vpc_security_group_id {
  value = module.vpc_security_group.security_group_id
}