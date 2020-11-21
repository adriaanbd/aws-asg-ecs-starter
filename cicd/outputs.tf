output "build_project" {
  value = {
    arn = module.build.build_project_arn,
    name = module.build.project_name
  }
}

output "codecommit_arn" {
  value = module.pipeline.codecommit_arn
}

output "dockerhub_params" {
  value = {
    username = {
      arn  = data.aws_ssm_parameter.dockerhub_username_param.arn, 
      name = data.aws_ssm_parameter.dockerhub_username_param.name
    }
    password = {
      arn  = data.aws_ssm_parameter.dockerhub_password_param.arn, 
      name = data.aws_ssm_parameter.dockerhub_password_param.name
    }
  }
}

output "ecr_repo_url" {
  value = module.build.ecr_repo_url
}