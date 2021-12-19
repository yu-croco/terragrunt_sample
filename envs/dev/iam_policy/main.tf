data "aws_iam_policy_document" "sample_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:Get*",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "sample_policy" {
  name   = "terragrunt-sample-policy"
  policy = data.aws_iam_policy_document.sample_policy.json
}

resource "aws_iam_role_policy_attachment" "sample_policy" {
  role       = var.iam_role_name
  policy_arn = aws_iam_policy.sample_policy.arn
}
