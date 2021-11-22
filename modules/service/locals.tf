locals {
  # principals = length(var.account_ids) > 0 ? [for a in var.account_ids : "arn:aws:iam::${a}:root"] : [data.aws_caller_identity.current.account_id]
  principals              = length(var.account_ids) > 0 ? [for a in var.account_ids : a] : [data.aws_caller_identity.current.account_id]
  create_service_iam_role = var.create_service_iam_role ? var.services : []
}
