variable "region" {
  description = "AWS Region for secruity group"
  type        = string
}

variable "project" {
  description = "Root level project name"
  type        = string
}

variable "environment" {
  type        = string
  description = "Options: development, qa, staging, production"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "Public subnet 1 CIDR"
  type = string
  default = "10.0.10.0/24"
}

variable "public_subnet_2_cidr" {
  description = "Public subnet 2 CIDR"
  type = string
  default = "10.0.20.0/24"
}

variable "private_subnet_1_cidr" {
  description = "Private subnet 1 CIDR"
  type = string
  default = "10.0.30.0/24"
}

variable "private_subnet_2_cidr" {
  description = "Private subnet 2 CIDR"
  type = string
  default = "10.0.40.0/24"  
}
