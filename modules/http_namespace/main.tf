resource "aws_service_discovery_http_namespace" "main" {
  count       = length(var.envs)
  name        = lower(local.namespace_name)
  description = "Namespace ${upper(var.client)} ${upper(var.envs[count.index])} ${upper(var.platform)}"

  tags = merge(var.tags,
    tomap({
      "Name" = local.namespace_name
  }))
}


