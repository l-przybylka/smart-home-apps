resource "aws_ami_from_instance" "apps" {
  count              = length(var.ec2_instances_ids)
  name               = "home-management-${var.services[count.index]}-app"
  source_instance_id = var.ec2_instances_ids[count.index]
}

resource "aws_launch_template" "apps" {
  count         = length(var.ec2_instances_ids)
  name          = "${var.services[count.index]}-launch-template"
  image_id      = aws_ami_from_instance.apps[count.index].id
  instance_type = var.instance_type
  key_name      = var.access_key

  network_interfaces {
    subnet_id                   = var.public_subnets_ids[count.index]
    associate_public_ip_address = true
    security_groups             = var.security_group_ids
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.services[count.index]}-launch-template"
    }
  }
}

resource "aws_autoscaling_group" "apps" {
  count               = length(var.ec2_instances_ids)
  name                = "asg-${var.services[count.index]}"
  min_size            = var.min_instances
  max_size            = var.max_instances
  desired_capacity    = var.des_instances
  vpc_zone_identifier = var.public_subnets_ids

  launch_template {
    id      = aws_launch_template.apps[count.index].id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "apps" {
  count                  = length(var.target_group_arns)
  autoscaling_group_name = aws_autoscaling_group.apps[count.index].id
  lb_target_group_arn    = var.target_group_arns[count.index]
}
