data "aws_ssm_parameter" "linux_latest_ami" {
  name = var.linux_ami_from_ssm_param
}

data "aws_ssm_parameter" "ecs_optimized_ami" {
  name = var.ecs_ami_from_ssm_param
}