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


# The service should be able to be contacted externally and interact with a DynamoDB table in your network.

# To contact DynamoDB you will need to create a user with polices to access DynamoDB. Give this user CLI access and use these credentials to authenticate your services in the env files.

# You will also have to set up a User for this service in IAM with a policy to be able to contact DynamoDB. We recommend creating this in the AWS console rather than creating this information using Terraform so as to not expose these keys in your state file.
