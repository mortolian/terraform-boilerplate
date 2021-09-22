terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
     }
  }

  # backend "s3" {}
  required_version = ">= 0.13"
}

provider "aws" {
  profile = var.aws_profile
  region = var.aws_region
}

module "instance" {
  source = "../modules/instance"
  name = "ExampleName"
  aws_ami = "ami-0a8e758f5e873d1c1" // Ubuntu 20.04 - Free Tier (eu-west-1)
  instance_type = "t2.micro"
  environment = "Staging"
}
output "instance-ec2-arn" {
  value = module.instance.ec2_arn
}
output "instance-ec2-public-ip" {
  value = module.instance.ec2_public_ip
}