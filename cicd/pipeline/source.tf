data "aws_codecommit_repository" "app" {
  repository_name = var.source_repo_name
}