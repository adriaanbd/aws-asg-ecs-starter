variable "namespace" {
  type        = string
  description = "Project namespace for unique resource naming"
  default     = "aws-starter"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "ssh_key_name" {
  type        = string
  description = "Key Name for SSH"
  default     = "aws-starter-key"
}

variable "os_username_for_ssh_key" {
  type        = string
  description = "OS Username that will use the generated SSH key"
}