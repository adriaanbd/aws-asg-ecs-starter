variable "namespace" {
  description = "Project namespace for unique resource naming"
  type        = string
  default     = "aws-starter"
}

variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
  type        = string
}

variable "ssh_key_name" {
  description = "Key Name for SSH"
  type        = string
  default     = "aws-starter-key"
}