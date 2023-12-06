variable "ec2_instances_ids" {
  type        = list(string)
  description = "List of the EC2 IDs"
}

variable "services" {
  type        = list(string)
  description = "List of the services used to create auto-scaling"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of the security group IDs"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of the public subnets"
}

variable "min_instances" {
  type        = number
  description = "A minimum number of instances for ASG"
}

variable "max_instances" {
  type        = number
  description = "A maximum number of instances for ASG"
}

variable "des_instances" {
  type        = number
  description = "A desired number of instances for ASG"
}

variable "access_key" {
  type        = string
  description = "PEM access key"
}
