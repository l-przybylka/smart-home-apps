output "vpc_id" {
  value       = aws_vpc.main.id
  description = "Outputs VPC ID to use it in different modules"
}
