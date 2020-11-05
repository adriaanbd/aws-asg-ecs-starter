# resource "aws_instance" "app_a" {
#   ami                    = var.ami_linux_2_id
#   instance_type          = var.instance_type
#   key_name               = var.ssh_key_name
#   subnet_id              = var.prv_sub_a_id
#   vpc_security_group_ids = [var.app_sg_id]
#   tags = {
#     Name        = "${var.namespace}-app_a"
#     Environemnt = "dev"
#   }
# }

