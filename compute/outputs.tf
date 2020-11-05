output "bastion_a_ip" {
  value = module.instances.bastion_a_ip
}

# output "app_a_ip" {
#   value = module.instances.app_a_ip
# }

output "asg_launch_config" {
  value = module.autoscaling.launch_config
}