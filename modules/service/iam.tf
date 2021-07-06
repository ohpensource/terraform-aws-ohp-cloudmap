# Service Role
resource "aws_iam_role" "main" {
  count = var.create_service_iam_role ? 1 : 0
  name  = "${var.namespace_name}-services-role"
  tags = merge(var.tags,
    tomap({
      "Name" = "${var.namespace_name}-services",
  }))
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = local.principals
    }
  }
}

resource "aws_iam_role_policy" "main" {
  count  = var.create_service_iam_role ? 1 : 0
  name   = "${var.service}-read-write-policy"
  role   = aws_iam_role.main.0.name
  policy = data.aws_iam_policy_document.rw_policy.json
}

data "aws_iam_policy_document" "rw_policy" {
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
    resources = [aws_service_discovery_service.main.arn]
  }

  statement {
    sid       = "Ssm"
    actions   = ["ssm:PutParameter"]
    resources = [aws_ssm_parameter.service_id.arn]
  }

}

# Update Namespace role

resource "aws_iam_role_policy" "namespace" {
  count  = var.namespace_role_name != null ? 1 : 0
  name   = "${var.service}-read-write-policy"
  role   = var.namespace_role_name
  policy = data.aws_iam_policy_document.rw_policy.json
}
