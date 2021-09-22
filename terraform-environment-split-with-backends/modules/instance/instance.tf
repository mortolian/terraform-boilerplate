resource "aws_instance" "instance" {
  ami             = var.aws_ami
  instance_type   = var.instance_type
  
  tags = {
    name          = var.name
    environment   = var.environment
  }
}