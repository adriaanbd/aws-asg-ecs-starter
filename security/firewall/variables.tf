variable "namespace" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "bastion_sg" {
  type        = string
  description = "Name of the Security Group for the Bastion Host"
  default     = "bastion_sg"
}

variable "app_sg" {
  type        = string
  description = "Name of the Security Group for the App Host"
  default     = "app_sg"
}

variable "alb_sg" {
  type        = string
  description = "Name of the Security Group for the ALB Host"
  default     = "alb_sg"
}