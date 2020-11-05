variable "namespace" {
  type = string
}

variable "cluster_name" {
  type        = string
  description = "describe your variable"
  default     = "aws-starter-cluster"
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

variable "ssh_key_name" {
  type        = string
  description = "Key name to SSH into ECS instances"
  default     = "aws-starter-key"
}