output "codecommit_arn" {
  value = data.aws_codecommit_repository.app.arn
}

output "bucket_arn" {
  value = aws_s3_bucket.pipeline_bucket.arn
}

output "pipeline_role_arn" {
  value = aws_s3_bucket.pipeline_bucket.arn
}