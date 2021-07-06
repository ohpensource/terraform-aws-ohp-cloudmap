
resource "aws_service_discovery_service" "main" {
  name         = var.service
  namespace_id = var.namespace_id
  description  = "${lower(var.namespace_name)} ${lower(var.service)}"
  tags = merge(var.tags,
    tomap({
      "Name" = lower(var.service),
  }))
}

resource "aws_ssm_parameter" "service_id" {
  name  = "/cloudmap/${var.namespace_name}/${var.service}/serviceid"
  type  = "String"
  value = aws_service_discovery_service.main.id
}
