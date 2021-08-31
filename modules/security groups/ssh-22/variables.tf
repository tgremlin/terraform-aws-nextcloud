variable "region" {
    description = "AWS Region for secruity group"
    type = string
}

variable "project" {
    description = "Root level project name"
    type = string
}

variable "vpc_id" {
    description = "ID for the VPC"
    type = string
}

variable "environment" {
    description = "Options: development, qa, staging, production"
    type = string
}

variable "ssh_allowed" {
    description = "CIDR block of IPs allowed to access servers via SSH"
    type = list(string)
}