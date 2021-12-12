data "aws_iam_policy_document" "ecs_task_additional_policy_doc" {
  statement {
    effect = "Allow"
    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ecs_task_additional_policy" {
  name        = "terragrunt-ecs-task-additional-policy"
  policy = data.aws_iam_policy_document.ecs_task_additional_policy_doc.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_additional_role_policy" {
  role       = var.iam_role_name
  policy_arn = aws_iam_policy.ecs_task_additional_policy.arn
}
