output "ec2-arn" {
  value = aws_instance.instance.arn
}

output "ec2-public-ip" {
  value = aws_instance.instance.public_ip
}