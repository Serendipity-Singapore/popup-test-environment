data "aws_ami" "ubuntu_lte_2004" {
  most_recent = true
  name_regex = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  owners = ["099720109477"] # Special Amazon owner
}

resource "aws_instance" test_server {
  ami = data.aws_ami.ubuntu_lte_2004.id
  instance_type = "t1.micro"
  get_password_data = true
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  tags = {
    Name = var.server_name_tag
  }
}