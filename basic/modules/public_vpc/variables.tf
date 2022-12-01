variable "vpc_name_tag" {
  description = "Label to display in the aws console"
  type = string
}

variable "vpc_availability_zone" {
  description = "Availability Zone"
  type = string
}

variable "vpc_tags" {
        type = map(string)
        default = {}
}

variable "igw_name_tag" {
  description = "Set the name of the internet gateway"
  type = string
}

variable "security_group_name" {
  type = string
}

variable "subnet_availability_zone" {
  type = string
}