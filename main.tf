provider "aws" {
  region = var.region
}

module "vpc" {
  source      = "github.com/tgremlin/terraform-aws-vpc.git"
  environment = var.environment
}

module "http80" {
  source      = "./modules/security groups/http-80"
  vpc_id      = module.vpc.vpc_id
  region      = var.region
  project     = var.project
  environment = var.environment
}

module "http443" {
  source      = "./modules/security groups/http-443"
  vpc_id      = module.vpc.vpc_id
  region      = var.region
  project     = var.project
  environment = var.environment
}

module "ssh22" {
  source      = "./modules/security groups/ssh-22"
  vpc_id      = module.vpc.vpc_id
  region      = var.region
  project     = var.project
  environment = var.environment
  ssh_allowed = [var.ssh_allowed]
}

module "alb" {
  source         = "./modules/load balancer/"
  vpc_id         = module.vpc.vpc_id
  lb_type        = "application"
  region         = var.region
  project        = var.project
  environment    = var.environment
  ssl_cert_arn   = var.ssl_cert_arn
  lb_sg          = ["${module.http80.lb_sg_id}", "${module.http443.lb_sg_id}"]
  public_subnets = module.vpc.public_subnets
}