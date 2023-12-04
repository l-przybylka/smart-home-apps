output "vpc_id" {
  value       = aws_vpc.main.id
  description = "Outputs VPC ID to use it in different modules"
}

output "public_subnets_ids" {
  value       = aws_subnet.public[*].id
  description = "List of the public subnets IDs"
}
