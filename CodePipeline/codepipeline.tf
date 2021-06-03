resource "aws_codepipeline" "Sparta42_BE" {
  name      = "sparta42-be-codepipeline"
  role_arn  = aws_iam_role.AWSCodePipelineRole.arn

  artifact_store {
    location  = aws_s3_bucket.Sparta42BE.bucket
    type      = "S3"
  }

  stage {
    name  = "Source"

    action {
      name              = "Source"
      category          = "Source"
      owner             = "AWS"
      provider          = "CodeStarSourceConnection"
      version           = "1"
      output_artifacts  = ["SRCarti"]

      configuration     = {
        # ConnectionArn     = "arn:aws:codestar-connections:ap-northeast-2:008302420937:connection/dfbae0ab-a210-4b67-887d-6a14ebe45ce9"
        # FullRepositoryId  = "Jack-R-lantern/BuildTEST"
        ConnectionArn     = "arn:aws:codestar-connections:us-east-2:008302420937:connection/a5e12534-2ecd-4329-9000-16e5a760afc4"
        FullRepositoryId  = "sparta42/Server-spring"
        BranchName        = "main"
      }
    }
  }

  stage {
    name  = "Build"
    
    action {
      name              = "Build"
      category          = "Build"
      owner             = "AWS"
      provider          = "CodeBuild"
      input_artifacts   = ["SRCarti"]
      output_artifacts  = ["BLDarti"]
      version           = "1"

      configuration     = {
        ProjectName = "sparta42be"
      }
    }
  }

  stage {
    name  = "Deploy"

    action {
      name              = "Deploy"
      category          = "Deploy"
      owner             = "AWS"
      provider          = "S3"
      input_artifacts   = ["BLDarti"]
      version           = "1"

      configuration     = {
        ObjectKey   = "sparta42be.zip"
        BucketName  = "sparta42be"
        Extract     = "false"
      }
    }
  }
}
