resource "aws_iam_role" "cloudmap_ro" {
  name               = "${var.prefix}-${var.project}-disco"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  tags = merge(local.default_tags,
    tomap({
      "Name"      = "${var.prefix}-${var.project}-disco",
      "Workspace" = lower(terraform.workspace),
  }))
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    dynamic "principals" {
      # for_each = var.ofs_accounts
      for_each = concat(local.account_ids, var.close_mgmt_account_ids)
      content {
        type        = "AWS"
        identifiers = ["arn:aws:iam::${principals.value}:root"]
      }
    }
  }
}

resource "aws_iam_role_policy_attachment" "cloudmap_ro_role_policy_attach" {
  role       = aws_iam_role.cloudmap_ro.name
  policy_arn = aws_iam_policy.cloudmap_ro_policy.arn
}

resource "aws_iam_policy" "cloudmap_ro_policy" {
  name        = "${var.prefix}-${var.project}-disco"
  path        = "/"
  description = "Allow read of services, namespaces, instances"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "servicediscovery:List*",
        "servicediscovery:DiscoverInstances",
        "servicediscovery:GetInstancesHealthStatus",
        "servicediscovery:GetInstance",
        "servicediscovery:GetNamespace",
        "servicediscovery:GetService"
      ],
      "Effect": "Allow",
      "Resource": ["*"]
    }
  ]
}
EOF
}

