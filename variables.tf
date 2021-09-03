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
  type        = list(string)
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

variable "webserver_instance_type" {
  description = "Instance class for the webserver instnace"
  type        = string
}

variable "key_name" {
  description = "AWS SSH keypair name"
  type        = string
}

variable "placement_strategy" {
  description = "Options: cluster, spread, partition"
  type        = string
}

variable "as_max_size" {
  description = "Auto-scaling group max size"
  type        = string
}

variable "as_min_size" {
  description = "Auto-scaling group min size"
  type        = string
}

variable "health_check_grace_period" {
  description = "Auto-scaling group health check grace period in seconds"
  type        = string
}

variable "health_check_type" {
  description = "Options: EC2, ELB"
  type        = string
}

variable "desired_capacity" {
  description = "Auto-scaling group desired capacity"
  type        = string
}

variable "key_path" {
  description = "Local path to private SSH key"
  type        = string
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
