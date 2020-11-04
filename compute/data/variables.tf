variable "ami_ssm_param_name" {
  description = "Parameter name of the AWS SSM Parameter for Amazon Machine Image"
  type        = string
  default     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}