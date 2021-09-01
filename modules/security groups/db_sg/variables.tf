variable "region" {
  description = "AWS Region for secruity group"
  type        = string
}

variable "project" {
  description = "Root level project name"
  type        = string
}

variable "vpc_id" {
  description = "ID for the VPC"
  type        = string
}

variable "environment" {
  description = "Options: development, qa, staging, production"
  type        = string
}

variable "db_from_port" {
    description = "From port for the DB instance"
    type = string
}

variable "db_to_port" {
    description = "To port for the DB instance"
    type = string
}
variable "server_sg_id" {
    description = "Security group of the webserver"
    type = string
}
