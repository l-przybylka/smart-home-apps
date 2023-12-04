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
