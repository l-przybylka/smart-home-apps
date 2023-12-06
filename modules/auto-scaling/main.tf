# resource "aws_ami_from_instance" "apps" {
#   count              = length(var.ec2_instances_ids)
#   name               = "home-management-${var.services[count.index]}-app"
#   source_instance_id = var.ec2_instances_ids[count.index]
# }

# resource "aws_launch_template" "apps" {
#   count    = length(var.ec2_instances_ids)
#   name     = "${var.services[count.index]}-launch-template"
#   image_id = aws_ami_from_instance.apps[count.index].id
#   key_name = var.access_key

#   network_interfaces {
#     subnet_id                   = var.public_subnets[count.index]
#     associate_public_ip_address = true
#     security_groups             = var.security_group_ids
#   }

#   tag_specifications {
#     resource_type = "instance"
#     tags = {
#       Name = "${var.services[count.index]}-launch-template"
#     }
#   }
# }

# resource "aws_autoscaling_group" "apps" {
#   min_size            = var.min_instances
#   max_size            = var.max_instances
#   desired_capacity    = var.des_instances
#   vpc_zone_identifier = var.public_subnets

#   launch_template {
#     id      = aws_launch_template.app_servers.id
#     version = "$Latest"
#   }
# }
