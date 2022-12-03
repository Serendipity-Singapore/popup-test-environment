variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "server_name_tag"{
  type = string
  description = "Name to show in server UI"
}

variable "server_ubuntu_public_key"{
  type = string
  description = "Ubuntu User public key"

}

variable "instance_type" {
  type = string
}