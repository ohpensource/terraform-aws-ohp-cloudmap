resource "aws_iam_role" "main" {
  count = length(var.account_ids) == 0 ? 0 : length(var.services)
  name  = "${local.role_prefix}-svc-${var.platform}-${var.client}-${var.dtap}-${var.services[count.index]}"
  tags = merge(var.tags,
    tomap({
      "Name" = "${local.role_prefix}-svc-${var.client}-${var.dtap}-${var.services[count.index]}",
  }))
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
}

data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = local.principals
    }
  }
}

resource "aws_iam_role_policy" "main" {
  count  = length(var.account_ids) == 0 ? 0 : length(var.services)
  name   = "${var.project}-service-${var.services[count.index]}"
  role   = aws_iam_role.main.*.name[count.index]
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ssm:PutParameter",
        "servicediscovery:TagResource",
        "servicediscovery:UntagResource",
        "servicediscovery:DiscoverInstances",
        "servicediscovery:ListTagsForResource",
        "servicediscovery:GetInstancesHealthStatus",
        "servicediscovery:GetInstance",
        "servicediscovery:UpdateInstanceCustomHealthStatus"
      ],
      "Effect": "Allow",
      "Resource": ["*"]
    }, 
    {
      "Action": [
        "servicediscovery:GetNamespace",
        "servicediscovery:DeregisterInstance",
        "servicediscovery:RegisterInstance",
        "servicediscovery:GetService",
        "servicediscovery:UpdateService",
        "route53:GetHealthCheck",
        "route53:CreateHealthCheck",
        "route53:UpdateHealthCheck",
        "route53:ChangeResourceRecordSets",
        "ec2:DescribeInstances",
        "route53:DeleteHealthCheck",
        "route53:ChangeResourceRecordSets"
      ],
      "Effect": "Allow",
      "Resource": ["*"]
    }
  ]
}
EOF
}

