resource "aws_codepipeline" "codepipeline" {
  name     = "${var.name}-pipeline"
  role_arn = aws_iam_role.pipeline_role.arn
 
  artifact_store {
    location = aws_s3_bucket.pipeline_bucket.bucket
    type     = "S3"
  }
 
  stage {
    name = "Source"
    # https://docs.aws.amazon.com/codepipeline/latest/userguide/action-reference-CodeCommit.html
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]
 
      configuration = {   
        RepositoryName        = "node-web-app"
        BranchName            = "master"
      }
    }
  }
 
  stage {
    name = "Build"
 
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"
 
      configuration = {
        ProjectName = var.build_project_name
      }
    }
  }

  stage {
    name = "Deploy"
    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeployToECS"
      input_artifacts = ["build_output"]
      version         = "1"
      configuration = {
        ApplicationName     = var.codedeploy_app_name
        DeploymentGroupName = var.codedeploy_group_name
        # https://github.com/gnokoheat/ecs-with-codepipeline-example-by-terraform/blob/9c86ca677c49c03ffb7ac637877ced97241ddc40/code-pipeline.tf#L199
      }
    }
  }
}