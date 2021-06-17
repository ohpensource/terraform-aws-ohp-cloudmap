resource "aws_service_discovery_http_namespace" "main" {
  count       = length(var.envs)
  name        = lower("${var.client}${var.envs[count.index]}-${var.platform}")
  description = "Namespace ${upper(var.client)} ${upper(var.envs[count.index])} ${upper(var.platform)}"

  tags = merge(var.tags,
    tomap({
      "Name" = "${var.client}${var.envs[count.index]}-${var.platform}"
  }))
}


