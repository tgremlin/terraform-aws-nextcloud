provider "aws" {
    region = var.region
}

data "aws_availability_zones" "available" {}

resource "aws_db_subnet_group" "db_group" {
    name = var.db_subnet_group_name
}