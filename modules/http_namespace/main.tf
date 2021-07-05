resource "aws_service_discovery_http_namespace" "main" {
  name        = lower(var.name)
  description = var.description

  tags = var.tags
}

# resource "aws_service_discovery_service" "main" {
#   count        = length(var.services)
#   name         = var.services[count.index]
#   namespace_id = aws_service_discovery_http_namespace.main.id
#   description  = "${lower(var.name)} ${lower(var.services[count.index])}"
#   tags = merge(var.tags,
#     tomap({
#       "Name" = lower(var.services[count.index]),
#   }))
# }

# resource "aws_ssm_parameter" "ssm_parameter" {
#   count = length(var.services)
#   name  = "/cloudmap/${var.name}/${var.services[count.index]}/serviceid"
#   type  = "String"
#   value = aws_service_discovery_service.main.*.id[count.index]
# }
