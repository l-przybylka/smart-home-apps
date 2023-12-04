variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "cidr" {
  type        = string
  description = "CIDR for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public CIDR blocks"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private CIDR blocks"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones for the VPC"
}
