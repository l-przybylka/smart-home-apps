output "instances_id" {
  value = [aws_instance.lighting.id, aws_instance.heating.id, aws_instance.status.id]
}
