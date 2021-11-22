output "arn" {
  value = { for k, v in var.services : v => aws_service_discovery_service.main[v].arn }
}

output "id" {
  value = { for k, v in var.services : v => aws_service_discovery_service.main[v].id }
}
