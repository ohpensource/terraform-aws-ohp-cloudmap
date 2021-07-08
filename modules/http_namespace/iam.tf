resource "aws_iam_role" "main" {
  count = var.create_iam_rw_role ? 1 : 0
  name  = "cloudmap-namespace-${var.name}"
  tags = merge(var.tags,
    tomap({
      "Name" = var.name,
  }))
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy[0].json
}

data "aws_iam_policy_document" "assume_role_policy" {
  count = var.create_iam_rw_role ? 1 : 0
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = sort(local.principals)
    }
  }
}

resource "aws_iam_role_policy" "main" {
  count  = var.create_iam_rw_role ? 1 : 0
  name   = "read-write-namespace-policy"
  role   = aws_iam_role.main.0.name
  policy = data.aws_iam_policy_document.rw_policy[0].json
}


data "aws_iam_policy_document" "rw_policy" {
  count = var.create_iam_rw_role ? 1 : 0
  statement {
    sid = "General"
    actions = [
      "servicediscovery:TagResource",
      "servicediscovery:ListServices",
      "servicediscovery:ListOperations",
      "servicediscovery:GetOperation",
      "servicediscovery:DiscoverInstances",
      "servicediscovery:ListNamespaces",
      "servicediscovery:UntagResource",
      "servicediscovery:ListTagsForResource",
      "servicediscovery:GetInstancesHealthStatus",
      "servicediscovery:GetInstance",
      "servicediscovery:UpdateInstanceCustomHealthStatus",
      "servicediscovery:ListInstances"
    ]
    resources = ["*"]
  }

  statement {
    sid       = "Namespace"
    actions   = ["servicediscovery:*"]
    resources = [aws_service_discovery_http_namespace.main.arn]
  }

}
