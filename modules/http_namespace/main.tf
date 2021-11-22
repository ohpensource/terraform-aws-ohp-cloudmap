resource "aws_service_discovery_http_namespace" "main" {
  name        = lower(var.name)
  description = var.description

  tags = var.tags
}
