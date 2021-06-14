resource "aws_service_discovery_service" "main" {
  count        = length(var.account_ids) == 0 ? 0 : length(var.services)
  name         = var.services[count.index]
  namespace_id = var.namespace_id
  description  = "${var.services[count.index]} ${var.dtap} ${var.client} ${var.platform}"
  tags = merge(var.default_tags,
    tomap({
      "Name"      = var.services[count.index],
      "Workspace" = lower(terraform.workspace),
      "Platform"  = var.platform,
      "Client"    = var.client,
      "Dtap"      = var.dtap
  }))
}

resource "aws_ssm_parameter" "ssm_parameter" {
  count = length(var.account_ids) == 0 ? 0 : length(var.services)
  name  = "/cloudmap/${var.platform}/${var.dtap}/${var.client}/${var.services[count.index]}/serviceid"
  type  = "String"
  value = aws_service_discovery_service.main.*.id[count.index]
}

