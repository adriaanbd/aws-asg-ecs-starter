variable "namespace" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ssh_key_name" {
  type        = string
  description = "Name of the generated AWS Key Pair"
  default     = "aws-starter-key"
}

variable "os_username" {
  type        = string
  description = "OS Username that will use the generated SSH key"
}