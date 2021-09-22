terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
     }
  }

  required_version = ">= 0.13"
}

provider "aws" {
  profile = var.aws_profile
  region = var.aws_region
}

module "instance" {
  source = "../modules/instance"
  name = "ExampleName"
  ami = "ami-0f7cd40eac2214b37" // Ubuntu 20.04 - Free Tier
  instance_type = "t2.micro"
}
