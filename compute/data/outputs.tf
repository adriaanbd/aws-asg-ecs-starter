output "ami_linux_2_id" {
  value = data.aws_ssm_parameter.ami_linux_2.value
}