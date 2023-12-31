resource "aws_lb_target_group" "apps" {
  count            = length(var.services)
  name             = "${var.services[count.index]}-target-group"
  port             = 3000
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  vpc_id           = var.vpc_id

  health_check {
    matcher = 200
    path    = "/api/${var.services[count.index]}/health"
  }
}

resource "aws_lb_target_group_attachment" "apps" {
  count            = length(var.instances_ids)
  target_group_arn = aws_lb_target_group.apps[count.index].arn
  target_id        = var.instances_ids[count.index]
}

resource "aws_lb" "apps" {
  name               = "apps-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.public_subnets_ids
}

resource "aws_lb_listener" "apps" {
  load_balancer_arn = aws_lb.apps.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.apps[2].arn
  }
}

resource "aws_lb_listener_rule" "apps" {
  count        = length(aws_lb_target_group.apps)
  listener_arn = aws_lb_listener.apps.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.apps[count.index].arn
  }

  condition {
    path_pattern {
      values = ["/api/${var.services[count.index]}"]
    }
  }
}
