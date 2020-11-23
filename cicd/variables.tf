variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "name" {
  type        = string
  description = "Name of your project for namespace purposes"
}

variable "ssm_kms_key_name" {
  type        = string
  description = "KMS key name for SSM Parameter Store"
  default     = "alias/codepipeline"
}

variable "dockerhub_params" {
  type = object({
    username = string,
    password = string
  })
  description = "Dockerhub SSM param names for login credentials"
  default = {
    username = "/general/dockerhub/username"
    password = "/general/dockerhub/password"
  }
}

# variable "alb_name" {
#   type        = string
# }

variable "ecs_service_name" {
  type = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "blue_lb_target_group_name" {
  type = string
}

variable "green_lb_target_group_name" {
  type = string
}

variable "alb_http_listener_arn" {
  type = string
}