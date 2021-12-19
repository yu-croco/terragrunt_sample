resource "aws_iam_role" "sample_role" {
  name                  = "terragrunt-sample-role"
  assume_role_policy    = data.aws_iam_policy_document.sample_policy.json
  force_detach_policies = false
}

data "aws_iam_policy_document" "sample_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}
