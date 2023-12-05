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
  description = "List of the public CIDR blocks"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of the private CIDR blocks"
}

variable "azs" {
  type        = list(string)
  description = "List of the availability zones for the VPC"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "access_key" {
  type        = string
  description = "PEM access key to connect to the instance"
}

variable "services" {
  type        = list(string)
  description = "List of the services used to create target groups"
}
