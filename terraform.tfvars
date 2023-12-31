vpc_name        = "home-management-project"
cidr            = "10.0.0.0/20"
public_subnets  = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24"]
azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
instance_type   = "t2.micro"
access_key      = "my-vm-key-pair"
ip_for_ssh_sg   = "86.24.169.23/32"
services        = ["lights", "heating", "status"]
min_instances   = 1
des_instances   = 2
max_instances   = 5
