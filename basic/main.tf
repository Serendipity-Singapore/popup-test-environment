provider "aws" {
    region = "ap-southeast-1"
}

module "test_vpc" {
    source = "./modules/public_vpc"
    vpc_name_tag = "test vpc name passing"
    vpc_tags = {
        Automation = "Terraform"
        Usage = "test"
    }
}