# Service Role
resource "aws_iam_role" "main" {
  for_each           = toset(local.create_service_iam_role)
  name               = "cloudmap-service-${var.namespace_name}-${each.key}"
  tags               = var.tags
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy[each.key].json
}

data "aws_iam_policy_document" "assume_role_policy" {
  for_each = toset(local.create_service_iam_role)
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = sort(local.principals)
    }
  }
}


resource "aws_iam_role_policy" "main" {
  for_each = toset(local.create_service_iam_role)
  name     = "read-write-policy"
  role     = aws_iam_role.main[each.key].name
  policy   = data.aws_iam_policy_document.rw_policy[each.key].json
}

data "aws_iam_policy_document" "rw_policy" {
  for_each = toset(local.create_service_iam_role)

  depends_on = [
    aws_service_discovery_service.main, aws_ssm_parameter.service_id
  ]
  statement {
    sid = "General"
    actions = [
      "servicediscovery:TagResource",
      "servicediscovery:UntagResource",
      "servicediscovery:DiscoverInstances",
      "servicediscovery:ListTagsForResource",
      "servicediscovery:GetInstancesHealthStatus",
      "servicediscovery:GetInstance",
      "servicediscovery:UpdateInstanceCustomHealthStatus",
      "servicediscovery:GetNamespace",
    ]
    resources = ["*"]
  }

  statement {
    sid       = "Service"
    actions   = ["servicediscovery:*"]
    resources = [aws_service_discovery_service.main[each.key].arn]
  }

  statement {
    sid       = "Ssm"
    actions   = ["ssm:PutParameter"]
    resources = [aws_ssm_parameter.service_id[each.key].arn]
  }

}

# Update Namespace role

resource "aws_iam_role_policy" "namespace" {
  for_each = toset(var.namespace_role_name != null ? var.services : [])
  name     = "${each.key}-read-write-policy"
  role     = var.namespace_role_name
  policy   = data.aws_iam_policy_document.rw_policy[each.key].json
}
