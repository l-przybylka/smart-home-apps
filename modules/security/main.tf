resource "aws_security_group" "ssh" {
  name        = "allow_ssh"
  description = "Allows SSH connections from the provided IP address"
  vpc_id      = var.vpc_id

  tags = {
    Name = "sg-ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.ssh.id

  cidr_ipv4   = "86.24.169.23/32"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_security_group" "http" {
  name        = "allow_http"
  description = "Allows HTTP connections"
  vpc_id      = var.vpc_id

  tags = {
    Name = "sg-http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.http.id

  cidr_ipv4   = "0.0.0.0/0"
  cidr_ipv6   = "::/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.http.id

  cidr_ipv4   = "0.0.0.0/0"
  cidr_ipv6   = "::/0"
  from_port   = 3000
  ip_protocol = "tcp"
  to_port     = 3000
}

resource "aws_security_group" "https" {
  name        = "allow_https"
  description = "Allows HTTPS connections"
  vpc_id      = var.vpc_id

  tags = {
    Name = "sg-https"
  }
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.https.id

  cidr_ipv4   = "0.0.0.0/0"
  cidr_ipv6   = "::/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.https.id

  cidr_ipv4   = "0.0.0.0/0"
  cidr_ipv6   = "::/0"
  from_port   = 3000
  ip_protocol = "tcp"
  to_port     = 3000
}

resource "aws_security_group" "egress" {
  name        = "allow_egress"
  description = "Allows Egress connections"
  vpc_id      = var.vpc_id

  tags = {
    Name = "sg-egress"
  }
}

resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.egress.id

  cidr_ipv4   = "0.0.0.0/0"
  cidr_ipv6   = "::/0"
  ip_protocol = "-1"
}
