variable "namespace" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "pub_sub_cidrs" {
  description = "Available cidr blocks for public subnets"
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.10.0/24"
  ]
}

variable "prv_sub_cidrs" {
  description = "Available cidr blocks for private subnets"
  type        = list(string)
  default = [
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.11.0/24"
  ]
}

variable "ddbb_sub_cidrs" {
  description = "Available cidr blocks for database subnets"
  type        = list(string)
  default = [
    "10.0.7.0/24",
    "10.0.8.0/24",
    "10.0.9.0/24",
    "10.0.12.0/24"
  ]
}

variable "subnets_per_vpc" {
  type        = number
  description = "Number of subnets per VPC"
  default     = 3
}
