output "private_ip_address" {
    value = aws_lightsail_instance.my-server.private_ip_address
  
}
output "public_ip_adress" {
    value = aws_lightsail_instance.my-server.public_ip_address
}
output "ssh_command" {
    value = "ssh -i ${local_file.my-key.filename} ec2-user@${aws_lightsail_instance.my-server.public_ip_address}"
  
}