output "build_project_arn" {
  value = aws_codebuild_project.app.arn
}

output "build_role_arn" {
  value = aws_iam_role.build_role.arn
}

output "project_name" {
  value = aws_codebuild_project.app.name
}

output "ecr_repo_url" {
  value = aws_ecr_repository.app.repository_url
}

output "ecr_repo_arn" {
  value = aws_ecr_repository.app.arn
}

output "ecr_image_name" {
  value = aws_ecr_repository.app.name
}