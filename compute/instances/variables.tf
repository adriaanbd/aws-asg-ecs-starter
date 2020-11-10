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

variable "ssh_key_name" {
  type        = string
  description = "Key Name of the Generated AWS Key Pair"
}

variable "bastion_sg_id" {
  type        = string
}

variable "general_sg_id" {
  type = string
}

variable "app_sg_id" {
  type        = string
}

variable "pub_sub_ids" {
  type = list(string)
}