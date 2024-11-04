terraform {
  backend "s3" {
    bucket         = "dev-ops-project-depi"
    key            = "terraform/state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = false
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Call Network Module
module "network" {
  source       = "./modules/network"
  vpc_cidr     = var.vpc_cidr
  subnet_cidr  = var.subnet_cidr
}

# Call EC2 Key Pair Module (commented out)
# module "key_pair" {
#   source = "./modules/key_pair"
# }

# Call EC2 Module
module "ec2" {
  source              = "./modules/ec2"
  ami                 = var.ami
  instance_type      = var.instance_type
  vpc_id             = module.network.vpc_id
  subnet_id          = module.network.subnet_id
  security_group_id  = module.network.security_group_id
  key_name           = "project"
}
