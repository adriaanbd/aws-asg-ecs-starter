variable "namespace" {
  type = string
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS Cluster"
  default     = "aws-starter-cluster"
}

variable "task_name" {
  type        = string
  description = "Name of the ECS Task"
  default     = "aws-starter-task"
}

variable "service_name" {
  type        = string
  description = "Name of the ECS Service"
  default     = "aws-starter-service"
}

variable "task_memory" {
  type        = number
  description = "Amount of Memory used by the task"
  default     = 300
}

variable "task_cpu" {
  type        = number
  description = "Amount of CPU Units used by the task"
  default     = 250
}

variable "desired_service_count" {
  type        = number
  description = "The number of instances of the task definition to place and keep running. Defaults to 0."
  default     = 1
}

variable "service_role" {
  type        = string
  description = "Name of the Role to use for ECS"
  default     = "ecsInstanceRole"
}
