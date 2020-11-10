variable "namespace" {
  type        = string
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

variable "general_sg_id" {
  type = string
}

variable "ecs_instance_role" {
  type        = string
  description = "Name of ECS Role"
  default     = "ecsInstanceRole"
}

variable "ecs_service_role_arn" {
  type        = string
  description = "ARN of ECS Service Role"
}

variable "alb_target_group_arn" {
  type = string
}

variable "pub_sub_ids" {
  type = list(string)
}

variable "prv_sub_ids" {
  type = list(string)
}
