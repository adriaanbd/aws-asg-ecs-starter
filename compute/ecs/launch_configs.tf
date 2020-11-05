resource "aws_launch_configuration" "launch_config" {
  name_prefix             = "${var.namespace}-lct-"
  image_id                = var.instance_ami
  instance_type           = var.instance_type
  iam_instance_profile    = var.instance_prof

  lifecycle {
    create_before_destroy = true
  }

  security_groups         = [var.app_sg_id]
  key_name                = var.ssh_key_name
  user_data_base64        = base64encode(
                            <<EOF
                            #!/bin/bash
                            echo ECS_CLUSTER=${var.cluster_name} >> /etc/ecs/ecs.config && \
                            echo ECS_BACKEND_HOST= >> /etc/ecs/ecs.config
                            EOF
                          )
  enable_monitoring       = true        # enabled by default
  root_block_device {
    volume_type           = "gp2"       # default is "standard"
    volume_size           = 30
    delete_on_termination = true        # default
    encrypted             = false       # default
  }
}