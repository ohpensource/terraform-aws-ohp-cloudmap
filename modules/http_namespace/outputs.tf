output "arn" {
  value = aws_service_discovery_http_namespace.main.arn
}

output "id" {
  value = aws_service_discovery_http_namespace.main.id
}

output "role_arn" {
  value = var.create_iam_rw_role ? aws_iam_role.main.0.arn : null
}

output "role_name" {
  value = var.create_iam_rw_role ? aws_iam_role.main.0.name : null
}
