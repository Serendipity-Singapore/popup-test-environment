provider "aws" {
    region = "ap-southeast-1"
}

module "test_vpc" {
    source = "./modules/public_vpc"
    igw_name_tag = "ephemeral_vpc_internet_gateway"
    security_group_name = "ephemeral_vpc_security_group"
    subnet_availability_zone = "ap-southeast-1a"
    vpc_name_tag = "ephemeral_vpc"
    vpc_availability_zone = "ap-southeast-1a"
}

module "ubuntu_server" {
    source = "./modules/ubuntu_server"
    server_name_tag = "ephemeral_vpc_server"
    security_group_id =  module.test_vpc.vpc_security_group_id
    subnet_id = module.test_vpc.vpc_public_subnet_id
}