variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "instances_id" {
  type        = list(string)
  description = "List of the EC2 IDs"
}
