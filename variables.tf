variable "region" {
  description = "AWS Region for secruity group"
  type        = string
}

variable "project" {
  description = "Root level project name"
  type        = string
}

variable "environment" {
  description = "Options: development, qa, staging, production"
  type        = string
}

variable "ssh_allowed" {
  description = "CIDR block of IPs allowed to access servers via SSH"
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

variable "hosted_zone_name" {
  description = "Public hosted zone name"
  type        = string
}
