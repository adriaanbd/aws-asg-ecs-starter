output "build_project_arn" {
  value = aws_codebuild_project.app.arn
}

output "project_name" {
  value = aws_codebuild_project.app.name
}

output "ecr_repo_url" {
  value = aws_ecr_repository.app.repository_url
}