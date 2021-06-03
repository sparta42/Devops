resource "aws_iam_role_policy_attachment" "CodePipeLineAttachment" {
  role        = aws_iam_role.AWSCodePipelineRole.name
  policy_arn  = aws_iam_policy.AWSCodePipelinePolicy.arn
}

resource "aws_iam_role_policy_attachment" "CodeBuildAttachment" {
  role        = aws_iam_role.AWSCodeBuildRole.name
  policy_arn  = aws_iam_policy.AWSCodeBuildBasePolicy.arn
}