resource "aws_iam_policy" "AWSCodePipelinePolicy" {
  name        = "AWSCodePipelinePolicy"
  path        = "/"
  description = "for my CodePipeline"

  policy      = file("./policy/AWSCodePipelinePolicy.json")
}

resource "aws_iam_policy" "AWSCodeBuildBasePolicy" {
  name        = "AWSCodeBuildBasePolicy"
  path        = "/"
  description = "for my CodeBuild"

  policy      = file("./policy/AWSCodeBuildBasePolicy.json")
}