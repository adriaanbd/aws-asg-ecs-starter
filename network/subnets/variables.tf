variable "namespace" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "pub_sub_cidrs" {
  description = "Available cidr blocks for public subnets"
  type        = list(string)
}

variable "prv_sub_cidrs" {
  description = "Available cidr blocks for private subnets"
  type        = list(string)
}

variable "ddbb_sub_cidrs" {
  description = "Available cidr blocks for database subnets"
  type        = list(string)
}

variable "subnets_per_vpc" {
  type        = number
  description = "Number of subnets per VPC"
  default     = 3
}

variable "azs" {
  type = list(string)
  description = "List of Availability Zones in this network"
}
