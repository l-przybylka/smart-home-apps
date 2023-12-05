resource "aws_lb_target_group" "lighting" {
  name             = "lighting-target-group"
  port             = 3000
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  vpc_id           = var.vpc_id

  health_check {
    matcher = 200
    path    = "/api/lights/health"
  }
}

resource "aws_lb_target_group_attachment" "lighting" {
  target_group_arn = aws_lb_target_group.lighting.arn
  target_id        = var.instances_id[0]
}

resource "aws_lb_target_group" "heating" {
  name             = "heating-target-group"
  port             = 3000
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  vpc_id           = var.vpc_id

  health_check {
    matcher = 200
    path    = "/api/heating/health"
  }
}

resource "aws_lb_target_group_attachment" "heating" {
  target_group_arn = aws_lb_target_group.heating.arn
  target_id        = var.instances_id[1]
}

resource "aws_lb_target_group" "heating" {
  name             = "heating-target-group"
  port             = 3000
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  vpc_id           = var.vpc_id

  health_check {
    matcher = 200
    path    = "/api/heating/health"
  }
}

resource "aws_lb_target_group_attachment" "heating" {
  target_group_arn = aws_lb_target_group.heating.arn
  target_id        = var.instances_id[1]
}

resource "aws_lb_target_group" "status" {
  name             = "status-target-group"
  port             = 3000
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  vpc_id           = var.vpc_id

  health_check {
    matcher = 200
    path    = "/api/status/health"
  }
}

resource "aws_lb_target_group_attachment" "status" {
  target_group_arn = aws_lb_target_group.heating.arn
  target_id        = var.instances_id[2]
}
