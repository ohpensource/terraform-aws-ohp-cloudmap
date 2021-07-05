
resource "aws_service_discovery_service" "main" {
  count        = length(var.services)
  name         = var.services[count.index]
  namespace_id = var.namespace_id
  description  = "${lower(var.namespace_name)} ${lower(var.services[count.index])}"
  tags = merge(var.tags,
    tomap({
      "Name" = lower(var.services[count.index]),
  }))
}

resource "aws_ssm_parameter" "service_id" {
  count = length(var.services)
  name  = "/cloudmap/${var.namespace_name}/${var.services[count.index]}/serviceid"
  type  = "String"
  value = aws_service_discovery_service.main.*.id[count.index]
}
