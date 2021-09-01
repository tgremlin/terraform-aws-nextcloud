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

variable "lb_type" {
  description = "Options: application, network"
  type        = string
}

variable "ssl_cert_arn" {
  description = "ARN for SSL certificate"
  type        = string
}

variable "lb_sg" {
  description = "Security groups for load balancer"
  type        = list(string)
}
variable "public_subnets" {
  description = "Public subnets to associate with the load balancer"
  type        = list(string)
}

variable "hosted_zone_name" {
    description = "Public hosted zone name"
    type = string
}