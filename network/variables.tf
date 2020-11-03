variable "namespace" {
  description = "Project namespace for unique resource naming"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for VPC"
  type        = string
  default     = "172.16.0.0/16"
}

variable "pub_cidr_a" {
  description = "The CIDR block for Public Subnet"
  type        = string
  default     = "172.16.1.0/24"
}

variable "prv_cidr_a" {
  description = "The CIDR block for Private Subnet"
  type        = string
  default     = "172.16.4.0/24"
}

variable "az_a" {
  description = "AWS Availability Zone"
  default     = "us-east-1a"
  type        = string
}