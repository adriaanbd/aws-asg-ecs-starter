variable "ecs_instance_role_arn" {
  type        = string
  description = "ARN of the ECS instance role. Defaults to a AWS managed role"
  default     = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}