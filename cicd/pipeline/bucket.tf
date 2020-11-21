resource "random_string" "rand" {
  length  = 24
  special = false
  upper   = false
}

locals {
  name = substr(join("-", [var.name, random_string.rand.result]), 0, 24)
}

resource "aws_s3_bucket" "pipeline_bucket" {
  bucket        = "${local.name}-pipeline-bucket"
  acl           = "private"
  force_destroy = true
}