data "aws_ssm_parameter" "ami_linux_2" {
  name = var.ssm_param_name
}