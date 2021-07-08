resource "aws_service_discovery_service" "main" {
  for_each = toset(var.services)

  name         = each.key
  namespace_id = var.namespace_id
  description  = "${lower(var.namespace_name)} ${lower(each.key)}"
  tags = merge(var.tags,
    tomap({
      "Name" = lower(each.key),
  }))
}

resource "aws_ssm_parameter" "service_id" {
  for_each = toset(var.services)
  name     = "/cloudmap/${var.namespace_name}/${each.key}/serviceid"
  type     = "String"
  value    = aws_service_discovery_service.main[each.key].id
}
