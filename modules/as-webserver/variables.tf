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

variable "webserver_instance_type" {
  description = "Instance class for the webserver instnace"
  type        = string
}

variable "key_name" {
  description = "AWS SSH keypair name"
  type        = string
}

variable "server_sg_id" {
  description = "Allow traffic on port 80 from load balancer"
  type        = list(string)
}

variable "ssh_sg_id" {
  description = "Allow SSH access from specified CIDR"
  type        = list(string)
}

variable "db_sg" {
  description = "Allow traffic to/from database"
  type        = list(string)
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

variable "public_subnets" {
  description = "List of subnets to deploy auto-scaling resources into"
  type        = list(string)
}

variable "instance_internet_sg_id" {
  description = "Instance internet security group"
  type = list(string)
}