variable "linux_ami_from_ssm_param" {
  description = "Parameter name of the AWS SSM Parameter for Amazon Machine Image"
  type        = string
  default     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

variable "ecs_ami_from_ssm_param" {
  type        = string
  description = "SSM Parameter Name of the ECS AMI"
  default     = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended"
}