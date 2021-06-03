resource "aws_codebuild_project" "sparta42be_build" {
  name          = "sparta42be"
  description   = "for sparta42 backend build"
  build_timeout = "5"
  service_role  = aws_iam_role.AWSCodeBuildRole.arn

  artifacts {
    type      = "CODEPIPELINE"
    # location  = aws_s3_bucket.Sparta42BE.bucket
    # path      = "/sparta42/result.zip"
    packaging = "ZIP"
  }

  # cache {
  #   type      = "S3"
  #   location  = aws_s3_bucket.Sparta42BE.bucket
  # }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:2.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }
  }

  source {
    type            = "CODEPIPELINE"
    # location        = "https://github.com/Jack-R-lantern/BuildTEST.git"
    # git_clone_depth = 1
  }
}