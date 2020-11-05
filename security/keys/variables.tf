variable "ssh_key_name" {
  type        = string
  description = "Name of the generated AWS Key Pair"
  default     = "aws-starter-key"
}

variable "os_username" {
  type = string
  description = "This is the in user in the OS that will use the SSH key."
}