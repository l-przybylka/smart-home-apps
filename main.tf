module "networking" {
  source = "./modules/networking"

  vpc_name        = var.vpc_name
  cidr            = var.cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

# Create security groups for your subnets to allow ingress and egress for HTTP and HTTPS request on the correct ports from all external sources.

# Make sure you can also SSH from your IP address!

module "security" {
  source = "./modules/security"

  vpc_id = module.networking.vpc_id
}
