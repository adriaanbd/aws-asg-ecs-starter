variable "ecs_instance_role_arn" {
  type        = string
  description = "ARN of the ECS instance role. Defaults to a AWS managed role"
  default     = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

variable "ecs_task_role_arn" {
  type        = string
  description = "ARN of the ECS task role. Defaults to a AWS managed role"
  default     = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

variable "ecs_service_role_arn" {
  type        = string
  description = "ARN of the ECS service role. Defaults to a AWS managed role"
  default     = "arn:aws:iam::*:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS*"
}

variable "ecr_repo_arn" {
  type = string
}

variable "ecs_cluster_arn" {
  type = string
}