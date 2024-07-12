variable "aws_region" {
  default = "us-east-1"
}


// VPC Variables
variable "vpc_cider" {
  default = "10.0.0.0/16"
}


// Public Subnet
variable "public_subnet_cider" {
  default = "10.0.1.0/24"
}


// Tags
variable "environment" {
  default = "terraformChamps"
}

variable "owner" {
  default = "Adham"
}