variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "azs" {
  type        = list(string)
  description = "List of the availability zones"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of the security group IDs"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of the public subnets"
}

variable "access_key" {
  type        = string
  description = "PEM access key to connect to the instance"
}
