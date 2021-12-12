resource "aws_iam_role" "ecs_task_role" {
  name                  = "terragrunt-ecs-task-role"
  assume_role_policy    = data.aws_iam_policy_document.ecs_task_assume_role_policy.json
  force_detach_policies = false
}

data "aws_iam_policy_document" "ecs_task_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}
