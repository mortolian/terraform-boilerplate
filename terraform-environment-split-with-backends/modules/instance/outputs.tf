output "ec2_arn" {
  value = aws_instance.instance.arn
}

output "ec2_public_ip" {
  value = aws_instance.instance.public_ip
}