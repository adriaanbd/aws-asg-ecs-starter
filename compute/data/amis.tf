data "aws_ssm_parameter" "ami_linux_2" {
  name = var.ami_ssm_param_name
}