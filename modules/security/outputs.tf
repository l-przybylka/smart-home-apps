output "security_group_ids" {
  value       = [aws_security_group.ssh.id, aws_security_group.http.id, aws_security_group.https.id, aws_security_group.egress.id]
  description = "List of the security group IDs"
}
