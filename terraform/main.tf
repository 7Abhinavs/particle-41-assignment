terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "partical41-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}


module "vpc" {
  source = "./modules/vpc"
}

module "alb" {
  source  = "./modules/alb"
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
}

module "ecs" {
  source           = "./modules/ecs"
  vpc_id           = module.vpc.vpc_id
  private_subnets  = module.vpc.private_subnets
  target_group_arn = module.alb.target_group_arn
}