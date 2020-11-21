variable "name" {
  type = string
}

variable "build_project_name" {
  type        = string
  description = "AWS CodeBuild project name"
}

variable "source_repo_name" {
  type        = string
  description = "Git Repository Name"
  default     = "node-web-app"
}
