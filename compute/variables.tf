variable "namespace" {
  type        = string
}

variable "pub_sub_a_id" {
  type        = number
  description = "The ID of the Public Subnet A"
}

variable "prv_sub_a_id" {
  type        = number
  description = "The ID of the Public Subnet A"
}

variable "instance_type" {
  type        = string
  description = "Main EC2 Instance Type"
  default     = "t2.micro"
}

variable "ssh_key_name" {
  type        = string
  description = "Name of key for SSH"
  default     = "aws-starter-key"
}

variable "bastion_sg_id" {
  type = number
  description = "Main EC2 Instance Type"
}
