module "networking" {
  source = "./modules/networking"

  vpc_name        = var.vpc_name
  cidr            = var.cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "security" {
  source = "./modules/security"

  vpc_id = module.networking.vpc_id
}

module "app-server" {
  source = "./modules/app-server"

  azs                = var.azs
  instance_type      = var.instance_type
  security_group_ids = module.security.security_group_ids
  public_subnets     = module.networking.public_subnets_ids
  access_key         = var.access_key
}

module "database" {
  source = "./modules/database"
}

module "load-balancing" {
  source = "./modules/load-balancing"

  vpc_id             = module.networking.vpc_id
  instances_ids      = module.app-server.instances_id
  public_subnets_ids = module.networking.public_subnets_ids
  security_group_ids = module.security.security_group_ids
  services           = var.services
}

module "auto-scaling" {
  source = "./modules/auto-scaling"

  ec2_instances_ids  = module.app-server.instances_id
  services           = var.services
  access_key         = var.access_key
  security_group_ids = module.security.security_group_ids
  public_subnets     = module.networking.public_subnets_ids
  min_instances      = var.min_instances
  max_instances      = var.max_instances
  des_instances      = var.des_instances
}
