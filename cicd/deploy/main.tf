# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-bluegreen.html
resource "aws_codedeploy_app" "this" {
  compute_platform = "ECS"
  name             = "aws-starter-deploy"
}

resource "aws_codedeploy_deployment_group" "this" {
  app_name               = aws_codedeploy_app.this.name
  deployment_group_name  = "aws-starter-deployment-group"
  service_role_arn       = aws_iam_role.deploy_role.arn
  deployment_config_name = "CodeDeployDefault.ECSAllAtOnce"

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  ecs_service {
    cluster_name = var.ecs_cluster_name
    service_name = var.ecs_service_name
  }

  load_balancer_info {
    target_group_pair_info {
      # The path used by a load balancer to route production traffic when an Amazon ECS deployment is complete.
      prod_traffic_route {
        listener_arns = var.lb_listener_arns
      }
      target_group {
        name = var.blue_lb_target_group_name
      }
      target_group {
        name = var.green_lb_target_group_name
      }
    }
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout    = "CONTINUE_DEPLOYMENT"
      wait_time_in_minutes = 0
    }

    green_fleet_provisioning_option {
      action = "DISCOVER_EXISTING"
    }

    terminate_blue_instances_on_deployment_success {
      action = "TERMINATE"
      termination_wait_time_in_minutes = 5
    }
  }
}
