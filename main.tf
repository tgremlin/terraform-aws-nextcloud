provider "aws" {
  region = var.region
}

module "vpc" {
  source      = "./modules/vpc"
  environment = var.environment
  region = var.region
  project = var.project
  enable_nat_gateway = true
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
  ssh_allowed = var.ssh_allowed
}

module "alb" {
  source           = "./modules/load balancer"
  vpc_id           = module.vpc.vpc_id
  lb_type          = "application"
  region           = var.region
  project          = var.project
  environment      = var.environment
  ssl_cert_arn     = var.ssl_cert_arn
  lb_sg            = ["${module.http80.lb_sg_id}", "${module.http443.lb_sg_id}"]
  public_subnets   = module.vpc.public_subnets
  hosted_zone_name = var.hosted_zone_name
}

module "db_sg" {
  source       = "./modules/security groups/db_sg"
  vpc_id       = module.vpc.vpc_id
  region       = var.region
  project      = var.project
  environment  = var.environment
  db_from_port = var.db_from_port
  db_to_port   = var.db_to_port
  server_sg_id = module.http80.server_sg_id
}

module "instance-internet" {
  source = "./modules/security groups/instance_internet"
  vpc_id  = module.vpc.vpc_id
  region = var.region
  project = var.project
  environment = var.environment

}

module "db_instance" {
  source = "./modules/database"
  #vpc_id      = module.vpc.vpc_id
  region               = var.region
  project              = var.project
  environment          = var.environment
  db_subnets           = module.vpc.database_subnets
  db_subnet_group_name = var.db_subnet_group_name
  db_sg_id             = [module.db_sg.db_sg_id]
  db_engine_version    = var.db_engine_version
  db_username          = var.db_username
  db_password          = var.db_password

}

resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer-key"
  public_key = file(var.key_path)
}

module "as_web" {
  source                    = "./modules/as-webserver"
  region                    = var.region
  project                   = var.project
  environment               = var.environment
  webserver_instance_type   = var.webserver_instance_type
  server_sg_id              = [module.http80.server_sg_id]
  ssh_sg_id                 = [module.ssh22.ssh_sg_id]
  db_sg                     = [module.db_sg.db_sg_id]
  instance_internet_sg_id  = [module.instance-internet.instance_internet_sg_id]
  placement_strategy        = var.placement_strategy
  as_max_size               = var.as_max_size
  as_min_size               = var.as_min_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  public_subnets            = module.vpc.public_subnets
  key_name                  = var.key_name

}