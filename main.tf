module "networking" {
  source = "./modules/networking"

  vpc_name        = var.vpc_name
  cidr            = var.cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}
