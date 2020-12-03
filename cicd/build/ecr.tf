resource "aws_ecr_repository" "app" {
  name = "${var.name}-ecr-repo"
}

# https://docs.amazonaws.cn/en_us/AmazonECR/latest/userguide/repository-policies.html
# resource "aws_ecr_repository_policy" "ecr_repo_policy" {
#   repository  = aws_ecr_repository.app.name
#   policy = jsonencode({
#     "Version": "2008-10-17",
#     "Statement": [
#       {
#         "Sid": "AllowDescribeCluster",
#         "Effect": "Allow",
#         "Action": [
#           "ecr:BatchCheckLayerAvailability",
#           "ecr:BatchGetImage",
#           "ecr:DescribeImages",
#           "ecr:DescribeRepositories",
#           "ecr:GetDownloadUrlForLayer",
#           "ecr:GetLifecyclePolicy",
#           "ecr:GetLifecyclePolicyPreview",
#           "ecr:GetRepositoryPolicy",
#           "ecr:ListImages"
#         ],
#         "Principal": {
#           "AWS": [
#             var.deploy_role_arn,
#             var.pipeline_role_arn
#           ]
#         }
#       }
#     ]
#   })
# }