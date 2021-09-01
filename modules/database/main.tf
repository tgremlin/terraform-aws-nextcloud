provider "aws" {
    region = var.region
}

data "aws_availability_zones" "available" {}

resource "aws_db_subnet_group" "db_group" {
    name = var.db_subnet_group_name
    subnet_ids = var.db_subnets

    tags = {
      Name = "${var.project}-db-subnet-group"
      Environment = var.environment
    }
}

resource "aws_db_instance" "db" {
    identifier = var.project
    instance_class = var.instance_class
    allocated_storage = var.db_storage
    engine = var.db_engine
    engine_version = var.db_engine_version
    username = var.db_username
    password = var.db_password
    db_subnet_group_name = aws_db_subnet_group.db_group.name
    vpc_security_group_ids = var.db_sg
    parameter_group_name = aws_db_parameter_group.db_parameter_group
    publicly_accessible = var.publicly_accessible
    skip_final_snapshot = var.skip_final_snapshot

}

resource "aws_db_parameter_group" "db_parameter_group" {
    name = "${var.project}-db_paramater_group"
    family = var.db_engine

    parameter {
      name = "log_connections"
      value = "1"
    }
}