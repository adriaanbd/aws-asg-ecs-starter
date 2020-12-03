data "aws_caller_identity" "current" {}
data "aws_kms_alias" "ssm_key" {
  name = var.ssm_kms_key_name
}
data "aws_ssm_parameter" "dockerhub_username_param" {
  name            = var.dockerhub_params.username
  with_decryption = true
}
data "aws_ssm_parameter" "dockerhub_password_param" {
  name            = var.dockerhub_params.password
  with_decryption = true
}

locals {
  dockerhub_params = {
    username = {
      arn  = data.aws_ssm_parameter.dockerhub_username_param.arn,
      val  = data.aws_ssm_parameter.dockerhub_username_param.value
    }
    password = {
      arn  = data.aws_ssm_parameter.dockerhub_password_param.arn,
      val  = data.aws_ssm_parameter.dockerhub_password_param.value
    }
  }
}

module "build" {
  source                 = "./build"
  aws_region             = var.aws_region
  name                   = var.name
  aws_account_id         = data.aws_caller_identity.current.account_id
  ssm_kms_key_arn        = data.aws_kms_alias.ssm_key.arn
  dockerhub_params       = local.dockerhub_params
  pipeline_bucket_arn    = module.pipeline.bucket_arn
  deploy_role_arn        = module.deploy.deploy_role_arn
  pipeline_role_arn      = module.pipeline.pipeline_role_arn
  task_definition_arn    = var.task_definition_arn
  task_definition_family = var.task_definition_family
  ecs_sg                 = var.ecs_sg
  private_subnet_ids     = var.private_subnet_ids
}

module "deploy" {
  source                     = "./deploy"
  name                       = var.name
  ecs_service_name           = var.ecs_service_name
  ecs_cluster_name           = var.ecs_cluster_name
  lb_listener_arns           = [var.alb_http_listener_arn]
  blue_lb_target_group_name  = var.blue_lb_target_group_name
  green_lb_target_group_name = var.green_lb_target_group_name
}

module "pipeline" {
  source                = "./pipeline"
  name                  = var.name
  build_project_name    = module.build.project_name
  codedeploy_app_name   = module.deploy.codedeploy_app_name
  codedeploy_group_name = module.deploy.codedeploy_group_name
}
