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
    "172.16.1.0/24",
    "172.16.2.0/24",
    "172.16.3.0/24",
    "172.16.10.0/24"
  ]
}

variable "prv_sub_cidrs" {
  description = "Available cidr blocks for private subnets"
  type        = list(string)
  default = [
    "172.16.4.0/24",
    "172.16.5.0/24",
    "172.16.6.0/24",
    "172.16.11.0/24"
  ]
}

variable "ddbb_sub_cidrs" {
  description = "Available cidr blocks for database subnets"
  type        = list(string)
  default = [
    "172.16.7.0/24",
    "172.16.8.0/24",
    "172.16.9.0/24",
    "172.16.12.0/24"
  ]
}

variable "bg_label" {
  type        = string
  description = "Blue OR Green label for Blue/Green Deployment"
  default     = "blue"
}