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

variable "db_from_port" {
  description = "From port for the DB instance"
  type        = string
}

variable "db_to_port" {
  description = "To port for the DB instance"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Name of the group of subnets your RDS cluster can be provisioned in"
  type        = string
}

variable "instance_class" {
  description = "DB Instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_storage" {
  description = "Amount of storage allocated for DB instance"
  type        = string
  default     = "5"
}

variable "db_engine" {
  description = "DB engine to use"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "DB Engine version"
  type        = string
}

variable "db_username" {
  description = "Root administrator for DB instance"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Root administrators password"
  type        = string
  sensitive   = true
}

variable "publicly_accessible" {
  description = "Is the DB instance publicly accessible? Default is false"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Skip taking a final snapshot before destroy operation. Default is false"
  type        = bool
  default     = false
}