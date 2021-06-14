output "arn" {
  value = length(var.account_ids) == 0 ? null : aws_service_discovery_service.main.*.arn
}

output "id" {
  value = length(var.account_ids) == 0 ? null : aws_service_discovery_service.main.*.id
}
