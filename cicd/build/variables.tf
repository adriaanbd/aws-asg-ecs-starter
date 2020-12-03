variable "aws_region" {
  type = string
}

variable "name" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "ssm_kms_key_arn" {
  type        = string
  description = "ARN for the AWS Key for SSM Dockerhub params"
}

variable "dockerhub_params" {
  type = map(map(string))
}

variable "pipeline_bucket_arn" {
  type = string
}

variable "deploy_role_arn" {
  type = string
}

variable "pipeline_role_arn" {
  type = string
}

variable "ecs_sg" {
  type = string
}

variable "task_definition_arn" {
  type = string
}

variable "task_definition_family" {
  type = string
}

variable "container_name" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}
