resource "aws_autoscaling_group" "asg_for_ecs" {
  name_prefix           = var.namespace
  max_size              = var.asg_max
  min_size              = var.asg_min
  desired_capacity      = var.asg_desired
  vpc_zone_identifier   = [var.prv_sub_a_id]
  launch_configuration  = aws_launch_configuration.launch_config.name
}