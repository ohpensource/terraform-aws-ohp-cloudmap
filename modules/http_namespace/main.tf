resource "aws_service_discovery_http_namespace" "main" {
  count       = length(var.envs)
  name        = "${var.client}${var.envs[count.index]}-${var.platform}"
  description = "Namespace ${upper(var.client)} ${upper(var.envs[count.index])} ${upper(var.platform)}"

  tags = merge(var.default_tags,
    tomap({
      "Name"      = "${var.client}${var.envs[count.index]}-${var.platform}",
      "Workspace" = lower(terraform.workspace),
      "Platform"  = var.platform,
      "Client"    = var.client,
      "Dtap"      = var.envs[count.index]
  }))
}

module "services" {
  source = "git@bitbucket.org:ohpen-dev/terraform-aws-ohp-cloudmap.git//modules/service?ref=v0.1.0"

  count = length(var.envs)

  services                      = var.services
  namespace_id                  = aws_service_discovery_http_namespace.main.*.id[count.index]
  namespace_arn                 = aws_service_discovery_http_namespace.main.*.arn[count.index]
  dtap                          = var.envs[count.index]
  client                        = var.client
  platform                      = var.platform
  default_tags                  = var.default_tags
  project                       = var.project
  prefix                        = var.prefix
  account_ids                   = var.client_map[var.envs[count.index]][var.platform]
  hierarchy_services_service_id = var.hierarchy_services_service_id
}

