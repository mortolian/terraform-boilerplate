variable "name" {
  type = string
  description = "The name of the instance"
}

variable "ami" {
  type = string
  description = "The AMI (Amazon Machine Image)"
  default = "ami-0f7cd40eac2214b37" // Ubuntu 20.04 - Free Tier
}

variable "instance_type" {
  type = string
  description = "The instance type you want to provision this resource on"
  default = "t2.micro"
}

variable "environment" {
  type = string
  description = "Set the environment you are running this workload in (TAG)"
  default = "staging"
}