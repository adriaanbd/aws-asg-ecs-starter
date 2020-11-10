variable "namespace" {
  type        = string
  description = "Project namespace for unique resource naming"
  default     = "aws-starter"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "ssh_key_name" {
  type        = string
  description = "Key Name for SSH"
  default     = "aws-starter-key"
}

variable "os_username_for_ssh_key" {
  type        = string
  description = "OS Username that will use the generated SSH key"
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