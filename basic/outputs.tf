output "popup_env_info" {
  value ={
    vpc_id = module.test_vpc.vpc_id
    vpc_arn = module.test_vpc.vpc_arn
    public_subnet_id = module.test_vpc.vpc_public_subnet_id
    security_group_id = module.test_vpc.vpc_security_group_id
    server_id = module.ubuntu_server.server_id
    server_arn = module.ubuntu_server.server_arn
    server_dns = module.ubuntu_server.server_dns
    server_ip = module.ubuntu_server.server_ip
  }
}