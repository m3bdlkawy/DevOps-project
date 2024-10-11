provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

# Call Network Module
module "network" {
  source     = "./modules/network"
  vpc_cidr   = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

# Call EC2 Key Pair Module
# module "key_pair" {
#  source = "./modules/key_pair"
# }

# Call EC2 Module
module "ec2" {
  source = "./modules/ec2"
  
  ami              = var.ami
  instance_type    = var.instance_type
  vpc_id           = module.network.vpc_id
  subnet_id        = module.network.subnet_id
  security_group_id = module.network.security_group_id
  key_name         = "project"
}

