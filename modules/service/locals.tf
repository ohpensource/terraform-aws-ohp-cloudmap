locals {
  principals  = [for account_id in var.account_ids : "arn:aws:iam::${account_id}:root"]
  role_prefix = var.prefix != null ? "${var.prefix}-${var.project}" : var.project
}
