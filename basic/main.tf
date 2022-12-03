provider "aws" {
    region = var.region
}

module "test_vpc" {
    source = "./modules/public_vpc"
    igw_name_tag = "ephemeral_vpc_internet_gateway"
    route_table_name_tag = "ephemeral_vpc_routing_table"
    security_group_name = "ephemeral_vpc_security_group"
    subnet_availability_zone = var.availability_zone
    vpc_name_tag = "ephemeral_vpc"
    vpc_availability_zone = var.availability_zone
    subnet_name_tag = "ephemeral_vpc_subnet"
}

module "ubuntu_server" {
    source = "./modules/ubuntu_server"
    server_name_tag = "ephemeral_vpc_server"
    security_group_id =  module.test_vpc.vpc_security_group_id
    subnet_id = module.test_vpc.vpc_public_subnet_id
    server_ubuntu_public_key = var.ubuntu_key
    instance_type = var.instance_type
}

