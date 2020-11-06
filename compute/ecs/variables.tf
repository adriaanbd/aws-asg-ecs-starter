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

variable "container_name" {
  type        = string
  description = "Name of the Docker Container Image for ECS"
  default     = "aws-starter-container"
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

variable "desired_tasks" {
  type        = number
  description = "The number of instances of the task definition to place and keep running. Defaults to 0."
  default     = 3
}

variable "instance_role" {
  type        = string
  description = "Name of the Role to use for ECS"
  default     = "ecsInstanceRole"
}

variable "service_role_arn" {
  type        = string
}

variable "alb_target_group_arn" {
  type = string
}

variable "min_healthy_percent" {
  type        = number
  description = "Lower limit on the number of running tasks during a deployment"
}

variable "max_percent" {
  type        = number
  description = "Upper limit on the number of running tasks during a deployment"
}