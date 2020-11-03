variable "vpc_id" {
  type        = number
  description = "ID of the main VPC"
}

variable "pub_cidr_a" {
  type        = string
  description = "The CIDR block for Public Subnet"
  default     = "172.16.1.0/24"
}

variable "prv_cidr_b" {
  type        = string
  description = "The CIDR block for Private Subnet"
  default     = "172.16.4.0/24"
}

variable "az_a" {
  type        = string
  description = "Availability Zone for Subnets A"
  default     = "us-east-1a"
}