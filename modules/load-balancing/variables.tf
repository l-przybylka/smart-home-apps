variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "instances_ids" {
  type        = list(string)
  description = "List of the EC2 IDs"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "public_subnets_ids" {
  type        = list(string)
  description = "List of public subnets IDs"
}

variable "services" {
  type        = list(string)
  description = "List of the services used to create target groups"
}
