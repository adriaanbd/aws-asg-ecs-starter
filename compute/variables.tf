variable "namespace" {
  type        = string
}

variable "pub_sub_a_id" {
  type        = string
  description = "The ID of the Public Subnet A"
}

variable "prv_sub_a_id" {
  type        = string
  description = "The ID of the Public Subnet A"
}

variable "pub_sub_b_id" {
  type        = string
  description = "The ID of the Public Subnet B"
}

variable "prv_sub_b_id" {
  type        = string
  description = "The ID of the Public Subnet B"
}

variable "instance_type" {
  type        = string
  description = "Main EC2 Instance Type"
  default     = "t2.micro"
}

variable "ecs_instance_profile_arn" {
  type        = string
  description = "ARN of the IAM instance profile for ECS"
}

variable "ssh_key_name" {
  type        = string
  description = "Name of key for SSH"
  default     = "aws-starter-key"
}

variable "bastion_sg_id" {
  type        = string
  description = "A Security Group to be used by the bastion instances"
}

variable "app_sg_id" {
  type        = string
  description = "A Security Group to be used by the instances in private subnet"
}

variable "ecs_service_role" {
  type        = string
  description = "Name of ECS Role"
  default     = "ecsInstanceRole"
}
