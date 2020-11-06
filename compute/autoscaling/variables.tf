variable "namespace" {
  type = string
}

variable "instance_ami" {
  type        = string
  description = "ID of the AMI to be used by ECS instances"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_prof" {
  type = string
}

variable "app_sg_id" {
  type = string
}

variable "bastion_sg_id" {
  type = string
}

variable "ssh_key_name" {
  type        = string
  description = "Key name to SSH into ECS instances"
  default     = "aws-starter-key"
}

variable "asg_min" {
  type        = number
  description = "Minimum number of instances in Autoscaling Group for ECS"
  default     = 2
}

variable "asg_max" {
  type        = number
  description = "Maximum number of instances in Autoscaling Group for ECS"
  default     = 4
}

variable "asg_desired" {
  type        = number
  description = "Desired number of instances in Autoscaling Group for ECS"
  default     = 3
}

variable "cluster_name" {
  type = string
}

variable "prv_sub_a_id" {
  type = string
}

variable "pub_sub_a_id" {
  type = string
}

variable "pub_sub_b_id" {
  type = string
}

variable "prv_sub_b_id" {
  type = string
}