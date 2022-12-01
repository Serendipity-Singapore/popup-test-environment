output "server_info" {
  value= {
    id = aws_instance.test_server.id
    arn = aws_instance.test_server.arn
    ip = aws_instance.test_server.public_ip
    dns = aws_instance.test_server.public_dns
  }
}

output "server_id" {
  value = aws_instance.test_server.id
}

output "server_arn" {
  value = aws_instance.test_server.arn
}

output "server_ip" {
  value = aws_instance.test_server.public_ip
}

output "server_dns" {
  value = aws_instance.test_server.public_dns
}