# Define the AWS provider and specify the region
provider "aws" {
  region = "us-east-1" # You can change this to your desired AWS region
}

# Data source to retrieve the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Resource to create an EC2 instance
resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro" # You can change this to your desired instance type
  tags = {
    Name = "MyWebServer"
  }
}
