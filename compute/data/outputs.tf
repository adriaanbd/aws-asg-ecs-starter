output "ami_linux_2_id" {
  value = data.aws_ssm_parameter.linux_latest_ami.value
}

output "ecs_ami" {
  value = jsondecode(data.aws_ssm_parameter.ecs_optimized_ami.value)["image_id"]
}