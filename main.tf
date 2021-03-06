module "parameter_store_task" {
  dead_letter_arn = var.dead_letter_arn
  handler         = "function.handler"
  kms_key_arn     = var.kms_key_arn
  l3_object_key   = "quinovas/parameter-store-task/parameter-store-task-0.1.0.zip"
  name            = "${var.name_prefix}parameter-store-task"

  policy_arns = [
    aws_iam_policy.parameter_store_task.arn,
  ]

  runtime = "python3.7"
  source  = "QuiNovas/lambdalambdalambda/aws"
  timeout = 300
  version = "3.0.1"
}

resource "aws_iam_policy" "parameter_store_task" {
  name   = "${var.name_prefix}parameter-store-task"
  policy = data.aws_iam_policy_document.parameter_store_task.json
}