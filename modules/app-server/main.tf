data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "lighting" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.ubuntu.id
  availability_zone      = var.azs[0]
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.public_subnets[0]
  key_name               = var.access_key

  tags = {
    Name = "Lighting app"
  }
}

resource "aws_instance" "heating" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.ubuntu.id
  availability_zone      = var.azs[1]
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.public_subnets[1]
  key_name               = var.access_key

  tags = {
    Name = "Heating app"
  }
}
