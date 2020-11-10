resource "aws_autoscaling_group" "asg_for_ecs" {
  name_prefix               = var.namespace
  max_size                  = var.asg_max       # required
  min_size                  = var.asg_min       # required
  desired_capacity          = var.asg_desired   # optional
  launch_configuration      = aws_launch_configuration.launch_config.name
  vpc_zone_identifier       = var.prv_sub_ids
  health_check_grace_period = 30                # default is 300
  # https://stackoverflow.com/questions/42466157/whats-the-difference-between-elb-health-check-and-ec2-health-check
  health_check_type         = "ELB"             # default is EC2
}