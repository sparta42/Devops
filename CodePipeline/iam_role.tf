resource "aws_iam_role" "AWSCodePipelineRole" {
  name                = "AWSCodePipelineRole"
  assume_role_policy  = file("./policy/assume_role_pipeline_policy.json")
}

resource "aws_iam_role" "AWSCodeBuildRole" {
  name  = "AWSCodeBuildRole"
  assume_role_policy  = file("./policy/assume_role_build_policy.json")
}