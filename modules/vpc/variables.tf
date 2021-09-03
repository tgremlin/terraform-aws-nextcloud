variable "region" {
  description = "AWS Region for secruity group"
  type        = string
}

variable "project" {
  description = "Root level project name"
  type        = string
}

variable "environment" {
    type = string
    description = "Options: development, qa, staging, production"
}
