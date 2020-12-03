resource "aws_codebuild_project" "app" {
  name          = "${var.name}-build"
  service_role  = aws_iam_role.build_role.arn

  source {
    type = "CODEPIPELINE"
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  # new
  logs_config {
    cloudwatch_logs {
      group_name  = "${var.name}-projects"
      stream_name = "prod/build"
    }
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true

    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = var.aws_account_id
    }

    environment_variable {
      name  = "IMAGE_REPO_NAME"
      value = aws_ecr_repository.app.name
    }

    environment_variable {
      name  = "DOCKERHUB_USERNAME"
      value = var.dockerhub_params.username.val
    }

    environment_variable {
      name  = "DOCKERHUB_PASSWORD"
      value = var.dockerhub_params.password.val
    }

    environment_variable {
      name  = "REPOSITORY_URI"
      value = aws_ecr_repository.app.repository_url
    }

    environment_variable {
      name  = "DEPLOY_EXECUTION_ROLE"
      value = var.deploy_role_arn
    }

    environment_variable {
      name  = "TASK_DEFINITION"
      value = var.task_definition_arn
    }

    environment_variable {
      name  = "TASK_FAMILY"
      value = var.task_definition_family
    }

    environment_variable {
      name  = "CONTAINER_NAME"
      value = var.container_name
    }

    environment_variable {
      name  = "ECS_SECURITY_GROUP"
      value = var.ecs_sg
    }

    dynamic "environment_variable" {
      for_each = var.private_subnet_ids
      content {
        name  = "SUBNET_${environment_variable.key + 1}"
        value = environment_variable.value
      }
    }
  }
}