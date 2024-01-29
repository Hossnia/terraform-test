resource "aws_lightsail_instance" "my-server" {
    name = "my-server"
    availability_zone = "us-east-1a"
    blueprint_id = "amazon_linux_2"
    bundle_id = "nano_1_0"
    user_data = "sudo yum install -y httpd && sudo systemctl start httpd && sudo systemctl enable httpd && echo '<h1>WELCOME TO MY AMAZON LIGHTSAIL SERVER. ENJOY YOUR QUICK TOUR!!!</h1>' | sudo tee /var/www/html/index.html "
    key_pair_name = "my-key"
}

resource "aws_lightsail_key_pair" "my-key" {
    name = "my-key"
  
}

resource "local_file" "my-key" {
    filename = "${path.module}/my-key.pem"
    content = aws_lightsail_key_pair.my-key.private_key
  
}