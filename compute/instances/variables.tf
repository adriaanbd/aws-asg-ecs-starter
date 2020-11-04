variable "namespace" {
  description = "Project namespace for unique resource naming"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t2.micro"
  type        = string
}

variable "ami_linux_2_id" {
  type        = string
  description = "ID of the Linux 2 AMI from SSM"
}

variable "pub_sub_a_id" {
  type        = string
  description = "ID of the Public Subnet A"
}

variable "prv_sub_a_id" {
  type        = string
  description = "ID of the Private Subnet A"
}

variable "bastion_sg_id" {
  type        = string
  description = "ID of the Security Group for Bastion Host"
}

variable "app_sg_id" {
  type        = string
  description = "ID of the Security Group for App Host"
}

variable "ssh_key_name" {
  type        = string
  description = "Key Name of the Generated AWS Key Pair"
}