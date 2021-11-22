resource "aws_iam_role" "cloudmap_ro" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  tags = merge(var.tags,
    tomap({
      "Name" = var.name,
  }))
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

resource "aws_iam_role_policy_attachment" "cloudmap_ro_role_policy_attach" {
  role       = aws_iam_role.cloudmap_ro.name
  policy_arn = aws_iam_policy.cloudmap_ro_policy.arn
}

resource "aws_iam_policy" "cloudmap_ro_policy" {
  name        = "read-only-policy"
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

