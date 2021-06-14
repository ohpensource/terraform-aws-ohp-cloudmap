output "arn" {
  value = aws_service_discovery_http_namespace.main.*.arn
}

output "id" {
  value = aws_service_discovery_http_namespace.main.*.id
}
