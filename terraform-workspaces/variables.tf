variable "aws_profile" {
  type = string
  description = "This is the AWS CLI profile to use"
  default = "default"
}

variable "aws_region" {
  type = string
  description = "The region resources will be provisioned in"
  default = "eu-west-1"
}