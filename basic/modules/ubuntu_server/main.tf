data "aws_ami" "ubuntu_lte_2004" {
  most_recent = true
  name_regex = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  owners = ["099720109477"] # Special Amazon owner
}

resource "aws_key_pair" "popup-ubuntu"{
  key_name = "popup-ubuntu"
  public_key = var.server_ubuntu_public_key
}

resource "aws_instance" test_server {
  ami = data.aws_ami.ubuntu_lte_2004.id
  instance_type = "t1.micro"
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true
  key_name = aws_key_pair.popup-ubuntu.key_name
  tags = {
    Name = var.server_name_tag
  }
  user_data = <<EOF
#!/bin/bash
sudo apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
EOF

}
