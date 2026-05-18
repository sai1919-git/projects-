module "vpc" {
  source = "./modules/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
  environment        = var.environment
}

module "security_groups" {
  source = "./modules/security-groups"

  vpc_id     = module.vpc.vpc_id
  environment = var.environment
}

module "ec2" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type

  subnet_id = module.vpc.subnet_id
  sg_id     = module.security_groups.sg_id

  key_name   = var.key_name
  environment = var.environment
}