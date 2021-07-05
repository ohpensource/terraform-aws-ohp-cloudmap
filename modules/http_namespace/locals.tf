locals {
  principals = length(var.account_ids) > 0 ? [for account_id in var.account_ids : "arn:aws:iam::${account_id}:root"] : [data.aws_caller_identity.current.account_id]
}
