variable "namespace" {
  type        = string
  description = "Project namespace for unique resource naming"
}

variable "vpc_id" {
  type        = string
  description = "ID of the main VPC"
}

variable "pub_sub_a_id" {
  type        = string
  description = "ID of the Public Subnet A"
}

variable "prv_sub_a_id" {
  type        = string
  description = "ID of the Private Subnet A"
}